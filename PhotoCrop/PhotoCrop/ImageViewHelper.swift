//
//  ImageViewHelper.swift
//  PhotoCrop
//
//  Created by Bassel Ezzeddine on 12/08/2018.
//  Copyright © 2018 Bassel Ezzeddine. All rights reserved.
//

import UIKit

extension UIImageView {
    
    // MARK: - Methods
    func realImageRect() -> CGRect {
        let imageViewSize = self.frame.size
        let imgSize = self.image?.size
        
        guard let imageSize = imgSize else {
            return CGRect.zero
        }
        
        let scaleWidth = imageViewSize.width / imageSize.width
        let scaleHeight = imageViewSize.height / imageSize.height
        let aspect = fmin(scaleWidth, scaleHeight)
        
        var imageRect = CGRect(x: 0, y: 0, width: imageSize.width * aspect, height: imageSize.height * aspect)
        
        // Center image
        imageRect.origin.x = (imageViewSize.width - imageRect.size.width) / 2
        imageRect.origin.y = (imageViewSize.height - imageRect.size.height) / 2
        
        // Add imageView offset
        imageRect.origin.x += self.frame.origin.x
        imageRect.origin.y += self.frame.origin.y
        
        return imageRect
    }
}
