//
//  ViewController.swift
//  MetalWatermark
//
//  Created by mac126 on 2018/5/31.
//  Copyright © 2018年 mac126. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    lazy var imgView:UIImageView = {
        let imgView:UIImageView = UIImageView(frame: CGRect(origin: CGPoint.init(x: self.view.center.x - 150, y: self.view.center.y - 150), size: CGSize(width: 300, height: 300)))
        imgView.tag = 99
        imgView.contentMode = .scaleAspectFill
        //        imgView.image = UIImage(named: "test.jpeg")
        return imgView
    }()
    
    let targetImage = UIImage(named : "test.JPG")!
    
    var player: AVPlayer! = nil
    var playerLayer: AVPlayerLayer! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func imageBtnClick(_ sender: UIButton) {
        playerLayer?.removeFromSuperlayer()
        self.view.viewWithTag(99)?.removeFromSuperview()
        let image = targetImage.createImageWaterMark(waterImage: UIImage(named: "logo")!)
        
        imgView.image = image
        self.view.addSubview(imgView)
    }
    
    
    @IBAction func videoBtnClick(_ sender: UIButton) {
        
        self.view.viewWithTag(99)?.removeFromSuperview()
        imgView.image = nil
        
        self.view.addSubview(imgView)
        let videoUrl = Bundle.main.url(forResource: "video", withExtension: "MP4")
        videoUrl?.createVideoWaterMark(waterImage: UIImage(named: "logo")!, completion: { (url, error) in
            

            if let url = url, error == nil {
                print("url-\(url)")
                var sizeOfVideo: CGSize!
                if let track = AVAsset(url: url).tracks(withMediaType: AVMediaType.video).first {
                    let size = track.naturalSize.applying(track.preferredTransform)
                    sizeOfVideo = CGSize(width: fabs(size.width), height: fabs(size.height))
                } else {
                    sizeOfVideo = CGSize.zero
                }
                print("-hh-\(sizeOfVideo)")
                
                DispatchQueue.main.async {
                    self.playVideo(url: url, view: self.imgView)
                }
            }
        })
    }
    
    func playVideo(url: URL, view: UIView) {
        playerLayer?.removeFromSuperlayer()
        
        player = AVPlayer(url: url)
        
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = view.bounds
        
        view.layer.addSublayer(playerLayer)
        
        player.play()
    }
    


}

