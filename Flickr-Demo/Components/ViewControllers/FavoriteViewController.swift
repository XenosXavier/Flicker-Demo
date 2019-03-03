//
//  FavoriteViewController.swift
//  Flickr-Demo
//
//  Created by Xenos Xavier on 2019/2/27.
//  Copyright © 2019年 Xenos Xavier. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    private let viewModel = FavoriteViewModel()
    private let cellNibName = "FavoriteCollectionViewCell"
    private let cellId = "Favorite"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCollectionView()
    }

    func initializeCollectionView() {
        self.collectionView.register(UINib(nibName: cellNibName, bundle: nil), forCellWithReuseIdentifier: cellId)
        self.collectionView.collectionViewLayout = UICollectionViewLayoutExtension.getFlickrCollectionViewLayout()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.viewModel.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension FavoriteViewController: FavoriteViewModelDelegate {
    func favoritePhotoDidRetrieve() {
        self.collectionView.reloadData()
    }
}

extension FavoriteViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getNumberOfPhotos()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        (cell as? RenderableComponent)?.render(indexPath: indexPath)
        return cell
    }
}
