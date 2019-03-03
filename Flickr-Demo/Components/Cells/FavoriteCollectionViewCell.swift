//
//  FavoriteCollectionViewCell.swift
//  Flickr-Demo
//
//  Created by Xenos Xavier on 2019/2/28.
//  Copyright © 2019年 Xenos Xavier. All rights reserved.
//

import UIKit

class FavoriteCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    private let viewModel = FavoriteCellViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    deinit {
        
    }
}

extension FavoriteCollectionViewCell: RenderableComponent {
    func render(indexPath: IndexPath) {
        self.loadingIndicator.startAnimating()
        viewModel.updateState(indexPath: indexPath)
        imageView.image = UIImage(data: viewModel.getPhotoData())
        titleLabel.text = viewModel.getPhotoTitle()
        self.loadingIndicator.stopAnimating()
    }
}
