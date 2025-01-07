//
//  FavoritesListVSViewController.swift
//  CursoPelado
//
//  Created by Agustin Carbajal on 04/01/2025.
//

import UIKit

class FavoritesListVSViewController: UIViewController {

    let tableView               = UITableView()
    var favorites:[Follower]    = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         // se pone en will pq cada vez que cambie de pantalla el did no se refresca pero el did si
        getFavorites()
    }
    
    func configureViewController(){
        view.backgroundColor    = .systemBackground
        title                   = "Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    func configureTableView(){
        view.addSubview(tableView)
        tableView.frame         = view.bounds // que ocupe todos los limites
        tableView.rowHeight     = 80
        tableView.delegate      = self
        tableView.dataSource    = self
        
        tableView.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.reuseID)
    }
    
    func getFavorites(){
        PersistenceManager.retrieveFavorites {
            [weak self] result in
            guard let self = self else { return }
            
            switch result {
                
            case .success(let favorites):
                if favorites.isEmpty {
                    showEmptyStateView(with: "No Favorites", in: self.view)
                } else {
                    self.favorites = favorites
                    DispatchQueue.main.async{
                        self.tableView.reloadData()
                        self.view.bringSubviewToFront(self.tableView)
                    }
                }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Ocurrio un error", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }

}

extension FavoritesListVSViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.reuseID) as! FavoriteCell
        let favorite = favorites[indexPath.row]
        cell.set(favorite: favorite)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favorite = favorites[indexPath.row]
        let destVC = FollowersListVCViewController()
        destVC.username = favorite.login
        destVC.title = favorite.login
        
        navigationController?.pushViewController(destVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        let favorite = favorites[indexPath.row]
        favorites.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
        
        PersistenceManager.updateWith(favorite: favorite, actionType: .remove) {
            [weak self] error in
            guard let self = self else { return }
            
            guard let error = error else { return }
            self.presentGFAlertOnMainThread(title: "Unable to remove", message: error.rawValue, buttonTitle: "OK")
        }
    }
}
