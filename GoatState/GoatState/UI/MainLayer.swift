//
//  MainLayer.swift
//  GoatState
//
//  Created by Mihaela Mihaljevic Jakic on 22/03/2017.
//  Copyright © 2017 Mihaela Mihaljevic Jakic. All rights reserved.
//

import UIKit

func fastFloor(_ x: CGFloat) -> CGFloat { return floor(x) }

class MainLayer :  CAShapeLayer {
    
    //MARK: -
    //MARK: Properties -
    
    var backColor: UIColor = UIColor.gray {
        didSet {
            configure()
        }
    }
    
    //MARK: -
    //MARK: Private -
    
    public func calculateLayerPath(rect: CGRect) ->UIBezierPath {
        var aPath : UIBezierPath = UIBezierPath()
        return aPath
    }
    
    func setupLayer() {
        self.frame = self.bounds
        let path = calculateLayerPath(rect: self.frame)
        self.path = path.cgPath
    
    }
    
    func configure() {
        self.fillColor = backColor.cgColor
    }
    
//INFO: for view
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        setupShapeLayer(bgLayer)
//        setupShapeLayer(fgLayer)
//    }
    
}
