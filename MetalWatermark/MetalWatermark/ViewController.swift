//
//  ViewController.swift
//  MetalWatermark
//
//  Created by mac126 on 2018/5/31.
//  Copyright © 2018年 mac126. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var imgView:UIImageView = {
        let imgView:UIImageView = UIImageView(frame: CGRect(origin: CGPoint.init(x: self.view.center.x - 150, y: self.view.center.y - 150), size: CGSize(width: 300, height: 300)))
        imgView.tag = 99
        imgView.contentMode = .scaleAspectFill
        //        imgView.image = UIImage(named: "test.jpeg")
        return imgView
    }()
    
    let targetImage = UIImage(named : "test.JPG")!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func imageBtnClick(_ sender: UIButton) {
        self.view.viewWithTag(99)?.removeFromSuperview()
        let image = targetImage.createImageWaterMark(waterImage: UIImage(named: "logo")!)
        
        imgView.image = image
        self.view.addSubview(imgView)
    }
    


}

