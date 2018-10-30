//
//  XPQrCode.swift
//  Pods-XPQrCode_Example
//
//  Created by jamalping on 2018/10/30.
//

import UIKit

public struct XPQrCode {
    
    /// The level of error correction
    ///
    /// - Low: 7%
    /// - Medium: 15%
    /// - Quartile:25%
    /// - High: 30%
    public enum ErrorCorrection: String {
        case Low = "L"
        case Medium = "M"
        case Quartile = "Q"
        case High = "H"
    }
    
    
    public let data: Data
    
    /// 二维码大小
    public var size = CGSize(width: 200, height: 200)
    
    /// 颜色
    public var color = CIColor(red: 0, green: 0, blue: 0)
    
    /// 背景色
    public var backgroundColor = CIColor(red: 1, green: 1, blue: 1)
    
    /// 分辨率
    public var errorCorrection = ErrorCorrection.Low
    
    // MARK: Init
    
    public init(_ data: Data) {
        self.data = data
    }
    
    public init?(_ string: String) {
        if let data = string.data(using: .utf8) {
            self.data = data
        } else {
            return nil
        }
    }
    
    public init?(_ url: URL) {
        if let data = url.absoluteString.data(using: .isoLatin1) {
            self.data = data
        } else {
            return nil
        }
    }
    
    public var image: UIImage? {
        guard let ciImage = ciImage else { return nil }
        
        // Size
        let ciImageSize = ciImage.extent.size
        let widthRatio = size.width / ciImageSize.width
        let heightRatio = size.height / ciImageSize.height
        
        return ciImage.nonInterpolatedImage(withScale: Scale(dx: widthRatio, dy: heightRatio))
    }
    
    /// The QRCode's CIImage representation
    public var ciImage: CIImage? {
        // Generate QRCode
        guard let qrFilter = CIFilter(name: "CIQRCodeGenerator") else { return nil }
        
        qrFilter.setDefaults()
        qrFilter.setValue(data, forKey: "inputMessage")
        qrFilter.setValue(self.errorCorrection.rawValue, forKey: "inputCorrectionLevel")
        
        // Color code and background
        guard let colorFilter = CIFilter(name: "CIFalseColor") else { return nil }
        
        colorFilter.setDefaults()
        colorFilter.setValue(qrFilter.outputImage, forKey: "inputImage")
        colorFilter.setValue(color, forKey: "inputColor0")
        colorFilter.setValue(backgroundColor, forKey: "inputColor1")
        
        return colorFilter.outputImage
    }
    
    // 合成头像图像
    public func insertAvatarImage(codeImage: UIImage, avatarImage: UIImage) -> UIImage? {
        
        let size = codeImage.size
        
        // 1. 开启图像的上下文
        UIGraphicsBeginImageContext(size)

        // 2. 绘制二维码图像
        codeImage.draw(in: CGRect.init(x: 0, y: 0, width: size.width, height: size.height))

        // 3. 计算头像的大小
        let w = size.width * 0.5
        let h = size.height * 0.5
        let x = (size.width - w) * 0.5
        let y = (size.height - h) * 0.5

        avatarImage.draw(in: CGRect.init(x: x, y: y, width: w, height: h))

        // 4. 从上下文中取出图像
        let image = UIGraphicsGetImageFromCurrentImageContext()

        // 5. 关闭上下文
        UIGraphicsEndImageContext()

        return image
     }}
