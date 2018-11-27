//
//  ImageDetailView.swift
//  NASA Image Search
//
//  Created by Tom Brook on 27/11/2018.
//  Copyright © 2018 Tom Brook. All rights reserved.
//

import UIKit

class ImageDetailView: UIViewController {
    
    // Data passed to this controller in segue
    var selectedImageData : NASAImageData?
    var imageURLString : String?
    
    var presenter : ImageDetailPresenter!

    // MARK: Outlets
    @IBOutlet weak var largeImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var centerLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    // MARK: Initial loading
    override func viewDidLoad() {
        super.viewDidLoad()

        // Initalize presents and configure view based on data from segue
        presenter = ImageDetailPresenter(view: self)
        presenter.configure()
        
        // Transparent navigation bar
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.backItem?.backBarButtonItem?.tintColor = UIColor.white
        UINavigationBar.appearance().tintColor = UIColor.white
    }
    
}
