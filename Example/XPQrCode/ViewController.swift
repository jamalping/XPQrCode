//
//  ViewController.swift
//  XPQrCode
//
//  Created by jamalping on 10/30/2018.
//  Copyright (c) 2018 jamalping. All rights reserved.
//

import UIKit
import XPQrCode

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

