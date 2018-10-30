# XPQrCode

[![CI Status](https://img.shields.io/travis/jamalping/XPQrCode.svg?style=flat)](https://travis-ci.org/jamalping/XPQrCode)
[![Version](https://img.shields.io/cocoapods/v/XPQrCode.svg?style=flat)](https://cocoapods.org/pods/XPQrCode)
[![License](https://img.shields.io/cocoapods/l/XPQrCode.svg?style=flat)](https://cocoapods.org/pods/XPQrCode)
[![Platform](https://img.shields.io/cocoapods/p/XPQrCode.svg?style=flat)](https://cocoapods.org/pods/XPQrCode)

## 示例
![image.png](https://upload-images.jianshu.io/upload_images/6165105-747893e3d051a5fa.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

XPQrCode is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'XPQrCode'
```

## user
```
let imageViewLarge = UIImageView.init(frame: CGRect.init(x: 100, y: 100, width: 100, height: 100))
        self.view.addSubview(imageViewLarge)
        
        let imageViewLarge1 = UIImageView.init(frame: CGRect.init(x: 100, y: 400, width: 100, height: 100))
        self.view.addSubview(imageViewLarge1)
        
        imageViewLarge.image = {
            
            var qrCode = XPQrCode("http://www.baidu.com")!
            qrCode.size = imageViewLarge.bounds.size
            qrCode.errorCorrection = .High
            return qrCode.insertAvatarImage(codeImage: qrCode.image!, avatarImage: UIImage.init(named: "rage")!)
        }()
        
        imageViewLarge1.image = {
            
            var qrCode = XPQrCode("http://www.baidu.com")!
            qrCode.size = imageViewLarge.bounds.size
            qrCode.errorCorrection = .High
            return qrCode.image
        }()
```

## Author

jamalping, 420436097@qq.com

## License

XPQrCode is available under the MIT license. See the LICENSE file for more info.
