//
//  ImageDetailPresenter.swift
//  NASA Image Search
//
//  Created by Tom Brook on 27/11/2018.
//  Copyright © 2018 Tom Brook. All rights reserved.
//

import Foundation
import Kingfisher

// Presenter for ImageDetailView
public class ImageDetailPresenter {
    
    // View reference
    unowned let view : ImageDetailView
    
    // MARK: Initalizers
    init(view: ImageDetailView) {
        self.view = view
    }
    
    // Configure the view with data from the model
    func configure() {
        if let imageData = view.selectedImageData {
            
            // Get data that was sent to view by segue
            let imageURL = URL(string: view.imageURLString!)
            
            // Asychronous task to load the full size image
            view.largeImageView.kf.setImage(with: imageURL)
            
            // Populate view labels with data
            view.titleLabel.text = imageData.title
            view.dateLabel.text = imageData.date 
            view.centerLabel.text = imageData.center
            view.descriptionTextView.text = imageData.description
        }
    }
}
