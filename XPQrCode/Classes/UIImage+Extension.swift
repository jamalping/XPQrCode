//
//  UIImage+Extension.swift
//  Pods-XPQrCode_Example
//
//  Created by jamalping on 2018/10/30.
//

import Foundation

import UIKit

public extension UIImageView {
    
    /// Creates a new image view with the given QRCode
    ///
    /// - parameter qrCode:      The QRCode to display in the image view
    public convenience init(qrCode: XPQrCode) {
        self.init(image: qrCode.image)
    }
    
}
