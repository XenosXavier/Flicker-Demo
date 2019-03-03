//
//  FlickrCollectionViewCell.swift
//  Flickr-Demo
//
//  Created by Xenos Xavier on 2019/2/27.
//  Copyright © 2019年 Xenos Xavier. All rights reserved.
//

import UIKit
import Kingfisher

class FlickrCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    private let viewModel = FlickrCellViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("Flickr Cell Awake")
    }
    
    deinit {
        print("Flickr Cell Deinit")
    }
}

extension FlickrCollectionViewCell: RenderableComponent {
    func render(indexPath: IndexPath) {
        viewModel.updateState(indexPath: indexPath)
        self.titleLabel.text = viewModel.getPhotoTitle()
        imageView.kf.setImage(with: self.viewModel.getPhotoURL(), completionHandler: { image, _, _, _ in
            if self.imageView.image != nil {
                self.loadingIndicator.stopAnimating()
            }
        })
    }
}

extension FlickrCollectionViewCell: ImageSaveBehaviour {
    func saveImage() {
        if let title = titleLabel.text,
            let image = imageView.image,
            let data = UIImageJPEGRepresentation(image, 0.8) {
            viewModel.saveImage(title: title, data: data)
        }
    }
}

