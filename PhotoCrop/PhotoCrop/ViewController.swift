//
//  ViewController.swift
//  PhotoCrop
//
//  Created by Bassel Ezzeddine on 12/08/2018.
//  Copyright © 2018 Bassel Ezzeddine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.minimumZoomScale = 1
            scrollView.maximumZoomScale = 2
        }
    }
    @IBOutlet weak var view_crop: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Actions
    @IBAction func button_crop_clicked(_ sender: Any) {
        guard let imageToCrop = imageView.image else {
            return
        }
        let cropRect = CGRect(x: view_crop.frame.origin.x - imageView.realImageRect().origin.x, y: view_crop.frame.origin.y - imageView.realImageRect().origin.y, width: view_crop.frame.width, height: view_crop.frame.height)
        let croppedImage = ImageCropHandler.sharedInstance.cropImage(imageToCrop, toRect: cropRect, viewWidth: imageView.frame.width, viewHeight: imageView.frame.height)
        imageView.image = croppedImage
        scrollView.zoomScale = 1
    }
    
    // MARK: - Methods
    func setupUI() {
        view_crop.layer.cornerRadius = 5
        view_crop.layer.borderWidth = 3
        view_crop.layer.borderColor = UIColor.black.cgColor
    }
}

// MARK: - UIScrollViewDelegate
extension ViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
