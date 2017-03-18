//
//  MessageBalloon.swift
//  message balloon
//
//  Created by Carlos Corrêa on 13/04/16.
//  Copyright © 2016 Carlos Corrêa. All rights reserved.
//

import Foundation
import UIKit

// MARK: Helpers

extension CGPath {
    //scaling :http://www.google.com/url?q=http%3A%2F%2Fstackoverflow.com%2Fquestions%2F15643626%2Fscale-cgpath-to-fit-uiview&sa=D&sntz=1&usg=AFQjCNGKPDZfy0-_lkrj3IfWrTGp96QIFQ
    //nice answer from David Rönnqvist!
    class func rescaleForFrame(_ path: CGPath, frame: CGRect) -> CGPath {
        let boundingBox = path.boundingBox
        let boundingBoxAspectRatio = boundingBox.width/boundingBox.height
        let viewAspectRatio = frame.width/frame.height
        
        var scaleFactor: CGFloat = 1.0
        if (boundingBoxAspectRatio > viewAspectRatio) {
            scaleFactor = frame.width/boundingBox.width
        } else {
            scaleFactor = frame.height/boundingBox.height
        }
        
        var scaleTransform = CGAffineTransform.identity
        scaleTransform = scaleTransform.scaledBy(x: scaleFactor, y: scaleFactor)
        scaleTransform = scaleTransform.translatedBy(x: -boundingBox.minX, y: -boundingBox.minY)
        let scaledSize = boundingBox.size.applying(CGAffineTransform(scaleX: scaleFactor, y: scaleFactor))
        let centerOffset = CGSize(width: (frame.width-scaledSize.width)/(scaleFactor*2.0), height: (frame.height-scaledSize.height)/(scaleFactor*2.0))
        scaleTransform = scaleTransform.translatedBy(x: centerOffset.width, y: centerOffset.height)
        if let resultPath = path.copy(using: &scaleTransform) {
            return resultPath
        }
        
        return path
    }
}


enum AnimationKeyPath:String {
    case
    scale        = "transform.scale",
    yPosition    = "position.y",
    opacity      = "opacity"
}

// MARK: Dots

class Dots: UIView,  CAAnimationDelegate {
    
    fileprivate var caLayer: CALayer = CALayer()
    var dotColor = UIColor.black {
        didSet {
            caLayer.backgroundColor = dotColor.cgColor
        }
    }
    
    fileprivate var replicator: CAReplicatorLayer {
        get {
            return layer as! CAReplicatorLayer
        }
    }
    
    override class var layerClass : AnyClass {
        return CAReplicatorLayer.self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    func commonInit() {
        
        replicator.backgroundColor = UIColor.clear.cgColor
        replicator.instanceCount = 3
        replicator.instanceDelay = 0.1
        
        caLayer = CALayer()
        caLayer.backgroundColor = dotColor.cgColor
        
        replicator.addSublayer(caLayer)
        
        layoutLayers()
        animationStart()
    }
    
    fileprivate func layoutLayers() {
        replicator.instanceTransform = CATransform3DMakeTranslation(dotSize * 1.6, 0.0, 0.0)
        
        caLayer.bounds =  CGRect(x: 0, y: 0, width: dotSize, height: dotSize)
        caLayer.position = CGPoint(x: center.x - (dotSize * 1.6), y: center.y + (dotSize * 0.2))
        caLayer.cornerRadius = dotSize / 2
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layoutLayers()
    }
    
    var dotSize: CGFloat {
        return bounds.height / 10
    }
    
    // Animations
    
    func createAnimation(_ keyPath:AnimationKeyPath, fromValue:CGFloat, toValue:CGFloat, duration:CFTimeInterval) -> CASpringAnimation{
        let animation = CASpringAnimation(keyPath: keyPath.rawValue)
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        return animation
    }
    
    func animationGroup(_ duration:CFTimeInterval, name:String, animations:[CASpringAnimation]) -> CAAnimationGroup {
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = animations
        animationGroup.duration = duration
        animationGroup.setValue(name, forKey: "animation")
        animationGroup.delegate = self
        animationGroup.isRemovedOnCompletion = false
        animationGroup.fillMode = kCAFillModeForwards
        return animationGroup
    }
    
    func animationStart() {
        let move = createAnimation(.yPosition, fromValue:caLayer.position.y, toValue: caLayer.position.y - dotSize, duration: 0.5)
        let alpha = createAnimation(.opacity, fromValue: 1.0, toValue: 0.0, duration: 0.5)
        let scale = createAnimation(.scale, fromValue: 1.0, toValue: 1.3, duration: 0.5)
        let anim = animationGroup(0.5, name: "up", animations: [move, alpha, scale])
        caLayer.add(anim, forKey: nil)
    }
    
    func animationEnd() {
        let move = createAnimation(.yPosition, fromValue:caLayer.position.y + 5, toValue:caLayer.position.y, duration:0.2)
        let alpha = createAnimation(.opacity, fromValue: 0.0, toValue: 1.0, duration: 0.5)
        let scale = createAnimation(.scale, fromValue: 0.5, toValue: 1.0, duration: 0.3)
        let anim = animationGroup(0.7, name: "down", animations: [move, alpha, scale])
        caLayer.add(anim, forKey: nil)
    }

    //MARK: - CAAnimationDelegate
    

    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if (anim.value(forKey: "animation") as! String == "up") {
            animationEnd()
        } else if (anim.value(forKey: "animation") as! String == "down") {
            animationStart()
        }
    }

}

// MARK: -
// MARK: - Balloon

@IBDesignable
class MessageBalloon: UIView {

    @IBInspectable var lineWidth:CGFloat = 5 {
        didSet {
            shapeLayer.lineWidth = lineWidth
        }
    }
    @IBInspectable var color: UIColor = UIColor.clear {
        didSet {
            shapeLayer.fillColor = color.cgColor
        }
    }
    @IBInspectable var lineColor: UIColor = UIColor.black {
        didSet {
            shapeLayer.strokeColor = lineColor.cgColor
        }
    }
    @IBInspectable var dotColor:UIColor = UIColor.black {
        didSet {
            dots.dotColor = dotColor
        }
    }
    
    var dots = Dots()
    
    lazy var bezierPath: UIBezierPath = {
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 127.63, y: 28.23))
        path.addCurve(to: CGPoint(x: 127.63, y: 72.77), controlPoint1: CGPoint(x: 140.12, y: 40.53), controlPoint2: CGPoint(x: 140.12, y: 60.47))
        path.addCurve(to: CGPoint(x: 87.79, y: 77.06), controlPoint1: CGPoint(x: 116.81, y: 83.42), controlPoint2: CGPoint(x: 100.17, y: 84.85))
        path.addCurve(to: CGPoint(x: 74, y: 81), controlPoint1: CGPoint(x: 86.02, y: 77.56), controlPoint2: CGPoint(x: 74, y: 81))
        path.addCurve(to: CGPoint(x: 78.78, y: 68.57), controlPoint1: CGPoint(x: 74, y: 81), controlPoint2: CGPoint(x: 77.82, y: 71.07))
        path.addCurve(to: CGPoint(x: 73.17, y: 47.25), controlPoint1: CGPoint(x: 74.27, y: 62.24), controlPoint2: CGPoint(x: 72.4, y: 54.63))
        path.addCurve(to: CGPoint(x: 82.37, y: 28.23), controlPoint1: CGPoint(x: 73.9, y: 40.3), controlPoint2: CGPoint(x: 76.97, y: 33.55))
        path.addCurve(to: CGPoint(x: 127.63, y: 28.23), controlPoint1: CGPoint(x: 94.87, y: 15.92), controlPoint2: CGPoint(x: 115.13, y: 15.92))
        
        return path
    }()
    
    override class var layerClass : AnyClass {
        return CAShapeLayer.self
    }
    
    fileprivate var shapeLayer: CAShapeLayer {
        return layer as! CAShapeLayer
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    fileprivate func commonInit() {
        dots = Dots(frame: bounds)
        dots.dotColor = dotColor
        addSubview(dots)
        
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.fillColor = color.cgColor
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.lineWidth = lineWidth
    }
    
    fileprivate func adjustShapeLayerPathForBounds(_ newBounds: CGRect) {
        shapeLayer.path = CGPath.rescaleForFrame(bezierPath.cgPath, frame: newBounds)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        adjustShapeLayerPathForBounds(bounds)
        dots.frame = bounds
    }
}
