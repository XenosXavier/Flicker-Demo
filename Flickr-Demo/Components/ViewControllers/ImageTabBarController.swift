//
//  ImageTabBarController.swift
//  Flickr-Demo
//
//  Created by Xenos Xavier on 2019/2/27.
//  Copyright © 2019年 Xenos Xavier. All rights reserved.
//

import UIKit

class ImageTabBarController: UITabBarController {
    private let searchResultViewController = SearchResultViewController()
    private let favoriteViewController = FavoriteViewController()
    private let viewModel = ImageTabBarViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTabBar()
        viewModel.delegate = self
        self.delegate = self
    }

    private func initializeTabBar() {
        searchResultViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        favoriteViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        self.viewControllers = [searchResultViewController, favoriteViewController]
    }
    
    fileprivate func updateNavigationTitle() {
        self.navigationItem.title = self.viewModel.getNavigationTitle(selectedIndex: self.selectedIndex)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ImageTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        updateNavigationTitle()
    }
}

extension ImageTabBarController: ImageTabBarViewModelDelegate {
    func searchTextDidRetrieve() {
        updateNavigationTitle()
    }
}
