//
//  ImageCropHandler.swift
//  PhotoCrop
//
//  Created by Bassel Ezzeddine on 12/08/2018.
//  Copyright © 2018 Bassel Ezzeddine. All rights reserved.
//

import UIKit

struct ImageCropHandler {
    
    // MARK: - Properties
    static let sharedInstance = ImageCropHandler()
    
    // MARK: - Methods
    func cropImage(_ inputImage: UIImage, toRect cropRect: CGRect, imageViewWidth: CGFloat, imageViewHeight: CGFloat) -> UIImage?
    {
        let imageViewScale = max(inputImage.size.width / imageViewWidth,
                                 inputImage.size.height / imageViewHeight)
        
        // Scale cropRect to handle images larger than shown-on-screen size
        let cropZone = CGRect(x: cropRect.origin.x * imageViewScale,
                              y: cropRect.origin.y * imageViewScale,
                              width: cropRect.size.width * imageViewScale,
                              height: cropRect.size.height * imageViewScale)
        
        // Perform cropping in Core Graphics
        guard let cutImageRef: CGImage = inputImage.cgImage?.cropping(to: cropZone)
            else {
                return nil
        }
        
        // Return image to UIImage
        let croppedImage: UIImage = UIImage(cgImage: cutImageRef)
        return croppedImage
    }
}
