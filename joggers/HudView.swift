//
//  HudView.swift
//  joggers
//
//  Created by Long Baolin on 16/4/19.
//  Copyright © 2016年 Lintasty. All rights reserved.
//

import UIKit

class HudView: UIView {
    var text = ""
    
    class func hudInView(_ view: UIView, animated: Bool) -> HudView {
        let hudView = HudView(frame: view.bounds)
        hudView.isOpaque = false
        
        view.addSubview(hudView)
        
        hudView.showAnimated(animated)
        return hudView
    }
    
    override func draw(_ rect: CGRect) {
        let boxWidth: CGFloat = 150
        let boxHeight: CGFloat = 150
        
        let boxRect = CGRect(
            x: round((bounds.size.width - boxWidth) / 2),
            y: round((bounds.size.height - boxHeight) / 2),
            width: boxWidth,
            height: boxHeight)
        
        let roundedRect = UIBezierPath(roundedRect: boxRect, cornerRadius: 10)
        MySpecialColors.specialWrite.setFill()
        roundedRect.fill()
        
        if let image = UIImage(named: "check") {
            let imagePoint = CGPoint(
                x: center.x - round(30),
                y: center.y - round(30) - boxHeight / 8)
            image.draw(in: CGRect(origin: imagePoint, size: CGSize(width: 60, height: 60)))
        }
        
        let attribs = [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 20),
                        NSAttributedStringKey.foregroundColor: MySpecialColors.specialRed ]
        
        let textSize = text.size(withAttributes: attribs)
        
        let textPoint = CGPoint(
            x: center.x - round(textSize.width / 2),
            y: center.y - round(textSize.height / 2) + boxHeight / 4)
        
        text.draw(at: textPoint, withAttributes: attribs)
    }
    
    func showAnimated(_ animated: Bool) {
        if animated {
            alpha = 0
            transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [], animations: {
                self.alpha = 1
                self.transform = CGAffineTransform.identity
                },completion: nil)
        }
    }

    
}
