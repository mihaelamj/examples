//
//  VoteView.swift
//
//  Code generated using QuartzCode 1.55.0 on 04/04/2017.
//  www.quartzcodeapp.com
//

import UIKit

@IBDesignable
class VoteView: UIView, CAAnimationDelegate {
	
	var layers : Dictionary<String, AnyObject> = [:]
	var completionBlocks : Dictionary<CAAnimation, (Bool) -> Void> = [:]
	var updateLayerValueForCompletedAnimation : Bool = false
	
	
	
	//MARK: - Life Cycle
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupProperties()
		setupLayers()
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		super.init(coder: aDecoder)
		setupProperties()
		setupLayers()
	}
	
	override var frame: CGRect{
		didSet{
			setupLayerFrames()
		}
	}
	
	override var bounds: CGRect{
		didSet{
			setupLayerFrames()
		}
	}
	
	func setupProperties(){
		
	}
	
	func setupLayers(){
		let main = CALayer()
		self.layer.addSublayer(main)
		main.anchorPoint     = CGPoint(x: 0.5, y: 1)
		main.frame           = CGRect(x: 0.34975 * main.superlayer!.bounds.width, y: 0.08486 * main.superlayer!.bounds.height, width: 0.30051 * main.superlayer!.bounds.width, height: 0.73333 * main.superlayer!.bounds.height)
		main.backgroundColor = UIColor(red:0.902, green: 0.902, blue:0.902, alpha:1).cgColor
		layers["main"] = main
		let fill = CALayer()
		main.addSublayer(fill)
		fill.anchorPoint     = CGPoint(x: 0.5, y: 1)
		fill.frame           = CGRect(x: -0.12804 * fill.superlayer!.bounds.width, y:  fill.superlayer!.bounds.height, width: 1.25608 * fill.superlayer!.bounds.width, height: 0.00455 * fill.superlayer!.bounds.height)
		fill.backgroundColor = UIColor(red:0.519, green: 0.775, blue:0.974, alpha:1).cgColor
		layers["fill"] = fill
		let peopleMask = CAShapeLayer()
		main.mask = peopleMask
		peopleMask.fillColor   = UIColor.white.cgColor
		peopleMask.strokeColor = UIColor(red:0.329, green: 0.329, blue:0.329, alpha:1).cgColor
		layers["peopleMask"] = peopleMask
		
		let percent = CATextLayer()
		self.layer.addSublayer(percent)
		percent.isHidden        = true
		percent.contentsScale   = UIScreen.main.scale
		percent.string          = "100%"
		percent.font            = "STHeitiSC-Medium" as CFTypeRef
		percent.fontSize        = 24
		percent.alignmentMode   = kCAAlignmentCenter;
		percent.foregroundColor = UIColor(red:0.0642, green: 0.818, blue:0.229, alpha:1).cgColor
		layers["percent"] = percent
		setupLayerFrames()
	}
	
	func setupLayerFrames() {
		CATransaction.begin()
		CATransaction.setDisableActions(true)
		
		if let main : CALayer = layers["main"] as? CALayer{
			main.frame = CGRect(x: 0.34975 * main.superlayer!.bounds.width, y: 0.08486 * main.superlayer!.bounds.height, width: 0.30051 * main.superlayer!.bounds.width, height: 0.73333 * main.superlayer!.bounds.height)
		}
		
		if let fill : CALayer = layers["fill"] as? CALayer{
			fill.frame = CGRect(x: -0.12804 * fill.superlayer!.bounds.width, y:  fill.superlayer!.bounds.height, width: 1.25608 * fill.superlayer!.bounds.width, height: 0.00455 * fill.superlayer!.bounds.height)
		}
		
		if let peopleMask : CAShapeLayer = layers["peopleMask"] as? CAShapeLayer{
			peopleMask.frame = CGRect(x: -0.0074 * peopleMask.superlayer!.bounds.width, y: 0.01668 * peopleMask.superlayer!.bounds.height, width: 1.0148 * peopleMask.superlayer!.bounds.width, height: 0.98105 * peopleMask.superlayer!.bounds.height)
			peopleMask.path  = peopleMaskPath(bounds: (layers["peopleMask"] as! CAShapeLayer).bounds).cgPath
		}
		
		if let percent : CATextLayer = layers["percent"] as? CATextLayer{
			percent.frame = CGRect(x: 0.36567 * percent.superlayer!.bounds.width, y: 0.85175 * percent.superlayer!.bounds.height, width: 0.26866 * percent.superlayer!.bounds.width, height: 0.09899 * percent.superlayer!.bounds.height)
		}
		
		CATransaction.commit()
	}
	
	//MARK: - Animation Setup
	
	func addOldAnimation(completionBlock: ((_ finished: Bool) -> Void)? = nil){
		if completionBlock != nil{
			let completionAnim = CABasicAnimation(keyPath:"completionAnim")
			completionAnim.duration = 1.439
			completionAnim.delegate = self
			completionAnim.setValue("old", forKey:"animId")
			completionAnim.setValue(false, forKey:"needEndAnim")
			layer.add(completionAnim, forKey:"old")
			if let anim = layer.animation(forKey: "old"){
				completionBlocks[anim] = completionBlock
			}
		}
		
		let fillMode : String = kCAFillModeForwards
		
		let fill = layers["fill"] as! CALayer
		
		////Fill animation
		let fillBoundsAnim            = CABasicAnimation(keyPath:"bounds")
		fillBoundsAnim.fromValue      = NSValue(cgRect: CGRect(x: 0, y: 0, width: 1.25608 * fill.superlayer!.bounds.width, height: 0.00455 * fill.superlayer!.bounds.height));
		fillBoundsAnim.toValue        = NSValue(cgRect: CGRect(x: 0, y: 0, width: 1.25608 * fill.superlayer!.bounds.width, height: 0.99091 * fill.superlayer!.bounds.height));
		fillBoundsAnim.duration       = 1
		fillBoundsAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
		
		let fillOldAnim : CAAnimationGroup = QCMethod.group(animations: [fillBoundsAnim], fillMode:fillMode)
		fill.add(fillOldAnim, forKey:"fillOldAnim")
		
		let percent = layers["percent"] as! CATextLayer
		
		////Percent animation
		let percentTransformAnim            = CABasicAnimation(keyPath:"transform")
		percentTransformAnim.fromValue      = NSValue(caTransform3D: CATransform3DMakeScale(0, 0, 1));
		percentTransformAnim.toValue        = NSValue(caTransform3D: CATransform3DIdentity);
		percentTransformAnim.duration       = 0.5
		percentTransformAnim.beginTime      = 0.939
		percentTransformAnim.timingFunction = CAMediaTimingFunction(controlPoints: 0.42, 0, 0.775, 1.61)
		
		let percentHiddenAnim       = CABasicAnimation(keyPath:"hidden")
		percentHiddenAnim.fromValue = false;
		percentHiddenAnim.toValue   = false;
		percentHiddenAnim.duration  = 0.129
		percentHiddenAnim.beginTime = 0.939
		
		let percentOldAnim : CAAnimationGroup = QCMethod.group(animations: [percentTransformAnim, percentHiddenAnim], fillMode:fillMode)
		percent.add(percentOldAnim, forKey:"percentOldAnim")
	}
	
	//MARK: - Animation Cleanup
	
	func animationDidStop(_ anim: CAAnimation, finished flag: Bool){
		if let completionBlock = completionBlocks[anim]{
			completionBlocks.removeValue(forKey: anim)
			if (flag && updateLayerValueForCompletedAnimation) || anim.value(forKey: "needEndAnim") as! Bool{
				updateLayerValues(forAnimationId: anim.value(forKey: "animId") as! String)
				removeAnimations(forAnimationId: anim.value(forKey: "animId") as! String)
			}
			completionBlock(flag)
		}
	}
	
	func updateLayerValues(forAnimationId identifier: String){
		if identifier == "old"{
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["fill"] as! CALayer).animation(forKey: "fillOldAnim"), theLayer:(layers["fill"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["percent"] as! CALayer).animation(forKey: "percentOldAnim"), theLayer:(layers["percent"] as! CALayer))
		}
	}
	
	func removeAnimations(forAnimationId identifier: String){
		if identifier == "old"{
			(layers["fill"] as! CALayer).removeAnimation(forKey: "fillOldAnim")
			(layers["percent"] as! CALayer).removeAnimation(forKey: "percentOldAnim")
		}
	}
	
	func removeAllAnimations(){
		for layer in layers.values{
			(layer as! CALayer).removeAllAnimations()
		}
	}
	
	//MARK: - Bezier Path
	
	func peopleMaskPath(bounds: CGRect) -> UIBezierPath{
		let peopleMaskPath = UIBezierPath()
		let minX = CGFloat(bounds.minX), minY = bounds.minY, w = bounds.width, h = bounds.height;
		
		peopleMaskPath.move(to: CGPoint(x:minX + 0.5 * w, y: minY))
		peopleMaskPath.addCurve(to: CGPoint(x:minX + 0.10161 * w, y: minY + 0.16887 * h), controlPoint1:CGPoint(x:minX + 0.27998 * w, y: minY), controlPoint2:CGPoint(x:minX + 0.10161 * w, y: minY + 0.07561 * h))
		peopleMaskPath.addCurve(to: CGPoint(x:minX + 0.5 * w, y: minY + 0.33774 * h), controlPoint1:CGPoint(x:minX + 0.10161 * w, y: minY + 0.26213 * h), controlPoint2:CGPoint(x:minX + 0.27998 * w, y: minY + 0.33774 * h))
		peopleMaskPath.addCurve(to: CGPoint(x:minX + 0.89839 * w, y: minY + 0.16887 * h), controlPoint1:CGPoint(x:minX + 0.72002 * w, y: minY + 0.33774 * h), controlPoint2:CGPoint(x:minX + 0.89839 * w, y: minY + 0.26213 * h))
		peopleMaskPath.addCurve(to: CGPoint(x:minX + 0.5 * w, y: minY), controlPoint1:CGPoint(x:minX + 0.89839 * w, y: minY + 0.07561 * h), controlPoint2:CGPoint(x:minX + 0.72002 * w, y: minY))
		peopleMaskPath.move(to: CGPoint(x:minX + 0.49113 * w, y: minY + 0.38207 * h))
		peopleMaskPath.addCurve(to: CGPoint(x:minX, y: minY + 0.57418 * h), controlPoint1:CGPoint(x:minX + 0.21499 * w, y: minY + 0.38207 * h), controlPoint2:CGPoint(x:minX, y: minY + 0.40355 * h))
		peopleMaskPath.addCurve(to: CGPoint(x:minX + 0.49113 * w, y: minY + h), controlPoint1:CGPoint(x:minX, y: minY + 0.74482 * h), controlPoint2:CGPoint(x:minX + 0.21499 * w, y: minY + h))
		peopleMaskPath.addCurve(to: CGPoint(x:minX + w, y: minY + 0.57418 * h), controlPoint1:CGPoint(x:minX + 0.76728 * w, y: minY + h), controlPoint2:CGPoint(x:minX + w, y: minY + 0.74482 * h))
		peopleMaskPath.addCurve(to: CGPoint(x:minX + 0.49113 * w, y: minY + 0.38207 * h), controlPoint1:CGPoint(x:minX + w, y: minY + 0.40355 * h), controlPoint2:CGPoint(x:minX + 0.76728 * w, y: minY + 0.38207 * h))
		
		return peopleMaskPath
	}
	
	
}
