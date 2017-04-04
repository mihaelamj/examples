//
//  GoatCrownView.swift
//  GoatState
//
//  Created by Mihaela Mihaljevic Jakic on 22/03/2017.
//  Copyright © 2017 Mihaela Mihaljevic Jakic. All rights reserved.
//

import UIKit

@IBDesignable
class GoatCrownView: UIView {
    
    //MARK: -
    //MARK: Private Properties -
    
    let goatLayer = CAShapeLayer()
    let crownLayer = CAShapeLayer()
    
    //MARK: -
    //MARK: Public Properties -
    
    @IBInspectable var goatColor: UIColor = UIColor.gray {
        didSet {
            configure()
        }
    }
    
    @IBInspectable var crownColor: UIColor = UIColor.gray {
        didSet {
            configure()
        }
    }
    
    //MARK: -
    //MARK: Framework Overrides -

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        configure()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
        configure()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupGoatLayer(goatLayer)
        setupCrownLayer(crownLayer)
    }
    
    //MARK: -
    //MARK: Private -
    
    private func setup() {
        goatLayer.fillColor = nil
        layer.addSublayer(goatLayer)
        crownLayer.fillColor = nil
        layer.addSublayer(crownLayer)
    }
    
    private func configure() {
        goatLayer.fillColor = goatColor.cgColor
        crownLayer.fillColor = crownColor.cgColor
    }
    
    func fastFloor(_ x: CGFloat) -> CGFloat {
        return floor(x)
    }
    
    //MARK: -
    //MARK: Private Layers -
    
    fileprivate func setupGoatLayer(_ shapeLayer:CAShapeLayer) {
        
        shapeLayer.frame = self.bounds
        let frame = self.bounds
        
        let goatPath = UIBezierPath(ovalIn: CGRect(x: frame.minX + fastFloor(frame.width * 0.20301),
                                                        y: frame.minY + fastFloor(frame.height * 0.39241),
                                                        width: fastFloor(frame.width * 0.79323) - fastFloor(frame.width * 0.20301),
                                                        height: fastFloor(frame.height) - fastFloor(frame.height * 0.39241)))
        shapeLayer.path = goatPath.cgPath
    }
    
    fileprivate func setupCrownLayer(_ shapeLayer:CAShapeLayer) {
        
        shapeLayer.frame = self.bounds
        let frame = self.bounds
        let midX = frame.width/2
        
        let crownPath = UIBezierPath()
        crownPath.move(to: CGPoint(x: frame.width/2, y: 0))
        crownPath.addCurve(to: CGPoint(x: frame.minX + 0.99922 * frame.width, y: frame.minY + 0.35262 * frame.height), controlPoint1: CGPoint(x: midX, y: 0), controlPoint2: CGPoint(x: frame.minX + 0.99922 * frame.width, y: frame.minY + 0.35262 * frame.height))
        crownPath.addLine(to: CGPoint(x: frame.minX + 0.80853 * frame.width, y: frame.minY + 0.92402 * frame.height))
        crownPath.addLine(to: CGPoint(x: frame.minX + 0.69791 * frame.width, y: frame.minY + 0.92402 * frame.height))
        crownPath.addCurve(to: CGPoint(x: frame.minX + 0.79323 * frame.width, y: frame.minY + 0.70042 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.75651 * frame.width, y: frame.minY + 0.86850 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.79323 * frame.width, y: frame.minY + 0.78887 * frame.height))
        crownPath.addCurve(to: CGPoint(x: frame.minX + 0.49812 * frame.width, y: frame.minY + 0.39662 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.79323 * frame.width, y: frame.minY + 0.53264 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.66111 * frame.width, y: frame.minY + 0.39662 * frame.height))
        crownPath.addCurve(to: CGPoint(x: frame.minX + 0.43267 * frame.width, y: frame.minY + 0.40412 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.47563 * frame.width, y: frame.minY + 0.39662 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.45372 * frame.width, y: frame.minY + 0.39921 * frame.height))
        crownPath.addCurve(to: CGPoint(x: frame.minX + 0.20301 * frame.width, y: frame.minY + 0.70042 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.30118 * frame.width, y: frame.minY + 0.43477 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.20301 * frame.width, y: frame.minY + 0.55579 * frame.height))
        crownPath.addCurve(to: CGPoint(x: frame.minX + 0.29833 * frame.width, y: frame.minY + 0.92402 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.20301 * frame.width, y: frame.minY + 0.78887 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.23973 * frame.width, y: frame.minY + 0.86850 * frame.height))
        crownPath.addLine(to: CGPoint(x: frame.minX + 0.19147 * frame.width, y: frame.minY + 0.92402 * frame.height))
        crownPath.addLine(to: CGPoint(x: frame.minX + 0.00078 * frame.width, y: frame.minY + 0.35262 * frame.height))
        crownPath.addCurve(to: CGPoint(x: frame.minX + 0.16665 * frame.width, y: frame.minY + 0.23529 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.00078 * frame.width, y: frame.minY + 0.35262 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.07524 * frame.width, y: frame.minY + 0.29995 * frame.height))
        crownPath.addCurve(to: CGPoint(x: midX, y: 0), controlPoint1: CGPoint(x: frame.minX + 0.31192 * frame.width, y: frame.minY + 0.13252 * frame.height), controlPoint2: CGPoint(x: midX, y: 0))
        crownPath.addLine(to: CGPoint(x: midX, y: 0))
        crownPath.close()
        
        shapeLayer.path = crownPath.cgPath
    }
    

}


func drawFake_GoatCrown(frame: CGRect = CGRect(x: 0, y: 0, width: 266, height: 237)) {
    //// General Declarations
    // This non-generic function dramatically improves compilation times of complex expressions.
    func fastFloor(_ x: CGFloat) -> CGFloat { return floor(x) }
    
    //// Color Declarations
    let color = UIColor(red: 0.725, green: 0.125, blue: 0.125, alpha: 1.000)
    
    //// Fake_Goat Drawing
    let fake_GoatPath = UIBezierPath(ovalIn: CGRect(x: frame.minX + fastFloor(frame.width * 0.20301 + 0.5), y: frame.minY + fastFloor(frame.height * 0.39241 + 0.5), width: fastFloor(frame.width * 0.79323 + 0.5) - fastFloor(frame.width * 0.20301 + 0.5), height: fastFloor(frame.height * 1.00000 + 0.5) - fastFloor(frame.height * 0.39241 + 0.5)))
    color.setFill()
    fake_GoatPath.fill()
    
    
    //// Fake_Crown Drawing
    let fake_CrownPath = UIBezierPath()
    fake_CrownPath.move(to: CGPoint(x: frame.width/2, y: 0))
    fake_CrownPath.addCurve(to: CGPoint(x: frame.minX + 0.99922 * frame.width, y: frame.minY + 0.35262 * frame.height), controlPoint1: CGPoint(x: 133, y: -0.13), controlPoint2: CGPoint(x: frame.minX + 0.99922 * frame.width, y: frame.minY + 0.35262 * frame.height))
    fake_CrownPath.addLine(to: CGPoint(x: frame.minX + 0.80853 * frame.width, y: frame.minY + 0.92402 * frame.height))
    fake_CrownPath.addLine(to: CGPoint(x: frame.minX + 0.69791 * frame.width, y: frame.minY + 0.92402 * frame.height))
    fake_CrownPath.addCurve(to: CGPoint(x: frame.minX + 0.79323 * frame.width, y: frame.minY + 0.70042 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.75651 * frame.width, y: frame.minY + 0.86850 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.79323 * frame.width, y: frame.minY + 0.78887 * frame.height))
    fake_CrownPath.addCurve(to: CGPoint(x: frame.minX + 0.49812 * frame.width, y: frame.minY + 0.39662 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.79323 * frame.width, y: frame.minY + 0.53264 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.66111 * frame.width, y: frame.minY + 0.39662 * frame.height))
    fake_CrownPath.addCurve(to: CGPoint(x: frame.minX + 0.43267 * frame.width, y: frame.minY + 0.40412 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.47563 * frame.width, y: frame.minY + 0.39662 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.45372 * frame.width, y: frame.minY + 0.39921 * frame.height))
    fake_CrownPath.addCurve(to: CGPoint(x: frame.minX + 0.20301 * frame.width, y: frame.minY + 0.70042 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.30118 * frame.width, y: frame.minY + 0.43477 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.20301 * frame.width, y: frame.minY + 0.55579 * frame.height))
    fake_CrownPath.addCurve(to: CGPoint(x: frame.minX + 0.29833 * frame.width, y: frame.minY + 0.92402 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.20301 * frame.width, y: frame.minY + 0.78887 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.23973 * frame.width, y: frame.minY + 0.86850 * frame.height))
    fake_CrownPath.addLine(to: CGPoint(x: frame.minX + 0.19147 * frame.width, y: frame.minY + 0.92402 * frame.height))
    fake_CrownPath.addLine(to: CGPoint(x: frame.minX + 0.00078 * frame.width, y: frame.minY + 0.35262 * frame.height))
    fake_CrownPath.addCurve(to: CGPoint(x: frame.minX + 0.16665 * frame.width, y: frame.minY + 0.23529 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.00078 * frame.width, y: frame.minY + 0.35262 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.07524 * frame.width, y: frame.minY + 0.29995 * frame.height))
    fake_CrownPath.addCurve(to: CGPoint(x: frame.width/2, y: 0), controlPoint1: CGPoint(x: frame.minX + 0.31192 * frame.width, y: frame.minY + 0.13252 * frame.height), controlPoint2: CGPoint(x: 133, y: -0.12))
    fake_CrownPath.addLine(to: CGPoint(x: frame.width/2, y: 0))
    fake_CrownPath.close()
    UIColor.gray.setFill()
    fake_CrownPath.fill()
}
