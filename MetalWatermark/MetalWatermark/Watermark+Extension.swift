//
//  Watermark+Extension.swift
//  MetalWatermark
//
//  Created by mac126 on 2018/5/31.
//  Copyright © 2018年 mac126. All rights reserved.
//

import UIKit

extension UIImage {
    
    /// 添加图片水印
    ///
    /// - Parameter waterImage: 水印图片
    /// - Returns: 新图片
    func createImageWaterMark(waterImage:UIImage) -> UIImage {
        
        // 开启画布
        UIGraphicsBeginImageContext(self.size)
        
        // 将原图绘制到画布上
        self.draw(in: CGRect(origin: CGPoint.zero, size: self.size))
        
        // 计算水印的位置
        let margin: CGFloat = 20
        let x = (size.width - waterImage.size.width) / 2
        let y = size.height - waterImage.size.height - margin
        let waterRect = CGRect(x: x,
                               y: y,
                               width: waterImage.size.width,
                               height: waterImage.size.height)
        
        // 将水印图片绘制到画布上
        waterImage.draw(in: waterRect)
        
        // 生成新图片
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}


