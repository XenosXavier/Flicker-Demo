//
//  SearchResultViewController.swift
//  Flickr-Demo
//
//  Created by Xenos Xavier on 2019/2/27.
//  Copyright © 2019年 Xenos Xavier. All rights reserved.
//

import UIKit

class SearchResultViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    private let viewModel = SearchResultViewModel()
    private let flickrCellNibName = "FlickrCollectionViewCell"
    private let flickrCellId = "Flickr"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCollectionView()
        addLongPressToCollectionView()
        viewModel.delegate = self
    }
    
    func initializeCollectionView() {
        self.collectionView.register(UINib(nibName: flickrCellNibName, bundle: nil), forCellWithReuseIdentifier: flickrCellId)
        self.collectionView.collectionViewLayout = UICollectionViewLayoutExtension.getFlickrCollectionViewLayout()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    func addLongPressToCollectionView() {
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        gesture.minimumPressDuration = 0.5
        gesture.delaysTouchesBegan = true
        self.collectionView.addGestureRecognizer(gesture)
    }

    @objc func handleLongPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state != .ended {
            return
        }
    
        let point = gesture.location(in: self.collectionView)
        if let indexPath = self.collectionView.indexPathForItem(at: point) {
            presentOptionMenu(indexPath: indexPath)
        }
    }
    
    func presentOptionMenu(indexPath: IndexPath) {
        let optionMenu = UIAlertControllerExtension.createActionSheet(title: nil, message: nil, actions: [
            UIAlertAction(title: "Add To Favorite", style: .default, handler: { [weak self] _ in
                let cell = self?.collectionView.cellForItem(at: indexPath)
                (cell as? ImageSaveBehaviour)?.saveImage()
            }),
            UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ])
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print("Remove Observer from " + String(describing: self))
    }
}

extension SearchResultViewController: SearchResultViewModelDelegate {
    func searchPhotoDidUpdate() {
        self.collectionView.reloadData()
    }
}

extension SearchResultViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getNumberOfPhotos()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: flickrCellId, for: indexPath)
        (cell as? RenderableComponent)?.render(indexPath: indexPath)
        return cell
    }
}
