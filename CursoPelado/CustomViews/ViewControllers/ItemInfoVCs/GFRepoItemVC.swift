//
//  GFRepoItemVC.swift
//  CursoPelado
//
//  Created by Agustin Carbajal on 06/01/2025.
//

import UIKit

class GFRepoItemVC: GFItemInfoVC { // estamos heredando todo GFItemInfoVC
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems(){
        itemInfoViewOne.set(itemInfoType: .repos, widthCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, widthCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "GithubProfile")
    }
}
