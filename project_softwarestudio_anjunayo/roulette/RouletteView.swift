//
//  RouletteView.swift
//  project_softwarestudio_anjunayo
//
//  Created by 안재은 on 21/05/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class RouletteView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    private var _diskImageName: String?
    var diskImageName: String? {
        get {
            return _diskImageName
        }
        
        set {
            _diskImageName = newValue
            if let imageName = newValue {
                self.layer.contents = UIImage(named: imageName)?.cgImage
            }
        }
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.prepareViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self.prepareViews()
    }
    
    private func prepareViews() {
        self.layer.contentsGravity = CALayerContentsGravity(rawValue: "resizeAspect")
        self.backgroundColor = UIColor.clear
    }
    
    func startRotation(angle: Double) {
        GZLogFunc()
        
        let rotate = CABasicAnimation(keyPath: "transform.rotation.z")
        let toValue = angle
        rotate.duration = 10
        rotate.fromValue = 0
        //rotate.isRemovedOnCompletion = false
        rotate.fillMode = CAMediaTimingFillMode.forwards
        rotate.toValue = toValue
        rotate.timingFunction = CAMediaTimingFunction(controlPoints: 0.0, 1.0, 1.0, 1)
        rotate.delegate = self as! CAAnimationDelegate
        
        self.layer.transform = CATransform3DMakeRotation(CGFloat(toValue), 0, 0, 1)
        self.layer.add(rotate, forKey: "")
    }


}

extension RouletteView: CAAnimationDelegate {
    func animationDidStart(_ anim: CAAnimation) {
        GZLogFunc()
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        GZLogFunc(flag)
    }
    
}
