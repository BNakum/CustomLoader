//
//  CustomProgressView.swift
//  CustomLoader
//
//  Created by CompuCharm Studios on 24/07/16.
//  Copyright © 2016 CompuCharm Studios. All rights reserved.
//

import UIKit

class CustomProgressView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    let circlePathLayer = CAShapeLayer()
    let circleRadius = 20
    
    var progress : CGFloat {
        get {
            return circlePathLayer.strokeEnd
        }
        
        set {
            print("New stroke \(progress)")
            
            if (newValue > 1) {
                circlePathLayer.strokeEnd = 1
            } else if (newValue < 0) {
                circlePathLayer.strokeEnd = 0
            } else {
                circlePathLayer.strokeEnd = newValue
            }
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLoader()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureLoader()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circlePathLayer.frame = bounds
        circlePathLayer.path = circlePath().CGPath
    }
    
    func configureLoader() {
        circlePathLayer.frame = bounds
        circlePathLayer.lineWidth = 3
        circlePathLayer.fillColor = UIColor.clearColor().CGColor
        circlePathLayer.strokeColor = UIColor.orangeColor().CGColor
        layer.addSublayer(circlePathLayer)
        backgroundColor = UIColor.grayColor()
        progress = 0.1
        
        let _ = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(increaseProgress), userInfo: nil, repeats: true)
    }
    
    func circleFrame() -> CGRect {
        var circleFrame = CGRect(x: 0, y: 0, width: 2 * circleRadius, height: 2 * circleRadius)
        circleFrame.origin.x = (CGRectGetMidX(circlePathLayer.bounds) - CGRectGetMidX(circleFrame))
        circleFrame.origin.y = (CGRectGetMidY(circlePathLayer.bounds) - CGRectGetMidY(circleFrame))
        return circleFrame
    }
    
    func circlePath() -> UIBezierPath {
        return UIBezierPath(ovalInRect:circleFrame())
    }
    
    func increaseProgress() {
        progress = (progress + 0.05)
    }
}
