//
//  GFFollowerItemVC.swift
//  CursoPelado
//
//  Created by Agustin Carbajal on 06/01/2025.
//

import UIKit

class GFFollowerItemVC: GFItemInfoVC { // estamos heredando todo GFItemInfoVC
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems(){
        itemInfoViewOne.set(itemInfoType: .followers, widthCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, widthCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user) // fijarse la cadena de delegates en userInfoVC y FollowerListVCViewController
    }
}
