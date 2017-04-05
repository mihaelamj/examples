//
//  GoatProgressView.swift
//
//  Code generated using QuartzCode 1.55.0 on 05/04/2017.
//  www.quartzcodeapp.com
//

import UIKit

@IBDesignable
class GoatProgressView: UIView, CAAnimationDelegate {
	
	var updateLayerValueForCompletedAnimation : Bool = false
	var animationAdded : Bool = false
	var completionBlocks : Dictionary<CAAnimation, (Bool) -> Void> = [:]
	var layers : Dictionary<String, AnyObject> = [:]
	
	
	
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
	
	var fillFromBottomAnimProgress: CGFloat = 0{
		didSet{
			if(!self.animationAdded){
				removeAllAnimations()
				addFillFromBottomAnimation()
				self.animationAdded = true
				layer.speed = 0
				layer.timeOffset = 0
			}
			else{
				let totalDuration : CGFloat = 1
				let offset = fillFromBottomAnimProgress * totalDuration
				layer.timeOffset = CFTimeInterval(offset)
			}
		}
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
		let mainLayer = CALayer()
		self.layer.addSublayer(mainLayer)
		layers["mainLayer"] = mainLayer
		let fill = CALayer()
		mainLayer.addSublayer(fill)
		layers["fill"] = fill
		let GoatWithCrownPath = CAShapeLayer()
		mainLayer.mask = GoatWithCrownPath
		layers["GoatWithCrownPath"] = GoatWithCrownPath
		
		resetLayerProperties(forLayerIdentifiers: nil)
		setupLayerFrames()
	}
	
	func resetLayerProperties(forLayerIdentifiers layerIds: [String]!){
		CATransaction.begin()
		CATransaction.setDisableActions(true)
		
		if layerIds == nil || layerIds.contains("mainLayer"){
			let mainLayer = layers["mainLayer"] as! CALayer
			mainLayer.backgroundColor = UIColor(red:0.902, green: 0.902, blue:0.902, alpha:1).cgColor
		}
		if layerIds == nil || layerIds.contains("fill"){
			let fill = layers["fill"] as! CALayer
			fill.anchorPoint     = CGPoint(x: 0.5, y: 1)
			fill.frame           = CGRect(x: -0.00316 * fill.superlayer!.bounds.width, y: 0.97524 * fill.superlayer!.bounds.height, width: 1.02846 * fill.superlayer!.bounds.width, height: 0.06903 * fill.superlayer!.bounds.height)
			fill.backgroundColor = UIColor(red:0.984, green: 0.000582, blue:0.0654, alpha:1).cgColor
		}
		if layerIds == nil || layerIds.contains("GoatWithCrownPath"){
			let GoatWithCrownPath = layers["GoatWithCrownPath"] as! CAShapeLayer
			GoatWithCrownPath.fillColor   = UIColor(red:0.745, green: 0.737, blue:0.737, alpha:1).cgColor
			GoatWithCrownPath.strokeColor = UIColor.black.cgColor
			GoatWithCrownPath.lineWidth   = 0
		}
		
		CATransaction.commit()
	}
	
	func setupLayerFrames(){
		CATransaction.begin()
		CATransaction.setDisableActions(true)
		
		if let mainLayer : CALayer = layers["mainLayer"] as? CALayer{
			mainLayer.frame = CGRect(x: 0.04995 * mainLayer.superlayer!.bounds.width, y: 0.05 * mainLayer.superlayer!.bounds.height, width: 0.9001 * mainLayer.superlayer!.bounds.width, height: 0.9 * mainLayer.superlayer!.bounds.height)
		}
		
		if let fill : CALayer = layers["fill"] as? CALayer{
			fill.frame = CGRect(x: -0.00316 * fill.superlayer!.bounds.width, y: 0.97524 * fill.superlayer!.bounds.height, width: 1.02846 * fill.superlayer!.bounds.width, height: 0.06903 * fill.superlayer!.bounds.height)
		}
		
		if let GoatWithCrownPath : CAShapeLayer = layers["GoatWithCrownPath"] as? CAShapeLayer{
			GoatWithCrownPath.frame = CGRect(x: 0.01108 * GoatWithCrownPath.superlayer!.bounds.width, y: 0, width:  GoatWithCrownPath.superlayer!.bounds.width, height:  GoatWithCrownPath.superlayer!.bounds.height)
			GoatWithCrownPath.path  = GoatWithCrownPathPath(bounds: (layers["GoatWithCrownPath"] as! CAShapeLayer).bounds).cgPath
		}
		
		CATransaction.commit()
	}
	
	//MARK: - Animation Setup
	
	func addFillFromBottomAnimation(completionBlock: ((_ finished: Bool) -> Void)? = nil) {
		if completionBlock != nil{
			let completionAnim = CABasicAnimation(keyPath:"completionAnim")
			completionAnim.duration = 1
			completionAnim.delegate = self
			completionAnim.setValue("fillFromBottom", forKey:"animId")
			completionAnim.setValue(false, forKey:"needEndAnim")
			layer.add(completionAnim, forKey:"fillFromBottom")
			if let anim = layer.animation(forKey: "fillFromBottom"){
				completionBlocks[anim] = completionBlock
			}
		}
		
		self.layer.speed = 1
		self.animationAdded = false
		
		let fillMode : String = kCAFillModeForwards
		
		let fill = layers["fill"] as! CALayer
        
        let minWidth = 0
        let maxWidth = 1.02846 * fill.superlayer!.bounds.width      //100%
        let minHeight = 0
        let maxHeight = 2.11111 * fill.superlayer!.bounds.height    //100%
		
		////Fill animation
		let fillBoundsAnim            = CAKeyframeAnimation(keyPath:"bounds")
                                                                                    //93
		fillBoundsAnim.values         = [NSValue(cgRect: CGRect(x: 0, y: 0, width: 1.02846 * fill.superlayer!.bounds.width, height: 0)), //NSValue(cgRect: CGRect(x: 0, y: 0, width: 93, height: 0))
                                                                                    //93                                    //190
		                                 NSValue(cgRect: CGRect(x: 0, y: 0, width: 1.02846 * fill.superlayer!.bounds.width, height: 2.11111 * fill.superlayer!.bounds.height))] //NSValue(cgRect: CGRect(x: 0, y: 0, width: 93, height: 190))]
        
        //fillBoundsAnim.values         = [NSValue(cgRect: CGRect(x: 0, y: 0, width: 93, height: 0)), NSValue(cgRect: CGRect(x: 0, y: 0, width: 93, height: 190))]
		fillBoundsAnim.keyTimes       = [0, 1]
		fillBoundsAnim.duration       = 1
		fillBoundsAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
		
		let fillFillFromBottomAnim : CAAnimationGroup = QCMethod.group(animations: [fillBoundsAnim], fillMode:fillMode)
		fill.add(fillFillFromBottomAnim, forKey:"fillFillFromBottomAnim")
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
		if identifier == "fillFromBottom"{
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["fill"] as! CALayer).animation(forKey: "fillFillFromBottomAnim"), theLayer:(layers["fill"] as! CALayer))
		}
	}
	
	func removeAnimations(forAnimationId identifier: String){
		if identifier == "fillFromBottom"{
			(layers["fill"] as! CALayer).removeAnimation(forKey: "fillFillFromBottomAnim")
		}
		self.layer.speed = 1
	}
	
	func removeAllAnimations(){
		for layer in layers.values{
			(layer as! CALayer).removeAllAnimations()
		}
		self.layer.speed = 1
	}
	
	//MARK: - Bezier Path
	
	func GoatWithCrownPathPath(bounds: CGRect) -> UIBezierPath{
		let GoatWithCrownPathPath = UIBezierPath()
		let minX = CGFloat(bounds.minX), minY = bounds.minY, w = bounds.width, h = bounds.height;
		
		GoatWithCrownPathPath.move(to: CGPoint(x:minX + 0.70114 * w, y: minY + 0.80844 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.55105 * w, y: minY + 0.89589 * h), controlPoint1:CGPoint(x:minX + 0.67015 * w, y: minY + 0.85144 * h), controlPoint2:CGPoint(x:minX + 0.61838 * w, y: minY + 0.88144 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.52683 * w, y: minY + 0.92933 * h), controlPoint1:CGPoint(x:minX + 0.54338 * w, y: minY + 0.90844 * h), controlPoint2:CGPoint(x:minX + 0.53516 * w, y: minY + 0.91944 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.78513 * w, y: minY + 0.95611 * h), controlPoint1:CGPoint(x:minX + 0.62093 * w, y: minY + 0.93078 * h), controlPoint2:CGPoint(x:minX + 0.70881 * w, y: minY + 0.94044 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.71392 * w, y: minY + 0.80256 * h), controlPoint1:CGPoint(x:minX + 0.77669 * w, y: minY + 0.89578 * h), controlPoint2:CGPoint(x:minX + 0.73736 * w, y: minY + 0.83522 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.70114 * w, y: minY + 0.80844 * h), controlPoint1:CGPoint(x:minX + 0.70737 * w, y: minY + 0.80356 * h), controlPoint2:CGPoint(x:minX + 0.70337 * w, y: minY + 0.80533 * h))
		GoatWithCrownPathPath.addLine(to: CGPoint(x:minX + 0.70114 * w, y: minY + 0.80844 * h))
		GoatWithCrownPathPath.close()
		GoatWithCrownPathPath.move(to: CGPoint(x:minX + 0.31219 * w, y: minY + 0.434 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.30219 * w, y: minY + 0.40322 * h), controlPoint1:CGPoint(x:minX + 0.30941 * w, y: minY + 0.42622 * h), controlPoint2:CGPoint(x:minX + 0.30574 * w, y: minY + 0.41533 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.29919 * w, y: minY + 0.40411 * h), controlPoint1:CGPoint(x:minX + 0.30108 * w, y: minY + 0.40356 * h), controlPoint2:CGPoint(x:minX + 0.30008 * w, y: minY + 0.40389 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.29308 * w, y: minY + 0.40611 * h), controlPoint1:CGPoint(x:minX + 0.29708 * w, y: minY + 0.40478 * h), controlPoint2:CGPoint(x:minX + 0.29508 * w, y: minY + 0.40544 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.26475 * w, y: minY + 0.41256 * h), controlPoint1:CGPoint(x:minX + 0.2863 * w, y: minY + 0.40844 * h), controlPoint2:CGPoint(x:minX + 0.27697 * w, y: minY + 0.41167 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.21609 * w, y: minY + 0.40478 * h), controlPoint1:CGPoint(x:minX + 0.25019 * w, y: minY + 0.41356 * h), controlPoint2:CGPoint(x:minX + 0.23464 * w, y: minY + 0.41111 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.16198 * w, y: minY + 0.35222 * h), controlPoint1:CGPoint(x:minX + 0.20309 * w, y: minY + 0.40033 * h), controlPoint2:CGPoint(x:minX + 0.16343 * w, y: minY + 0.38689 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.18076 * w, y: minY + 0.31311 * h), controlPoint1:CGPoint(x:minX + 0.16132 * w, y: minY + 0.33567 * h), controlPoint2:CGPoint(x:minX + 0.16987 * w, y: minY + 0.32278 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.00011 * w, y: minY + 0.13611 * h), controlPoint1:CGPoint(x:minX + 0.12732 * w, y: minY + 0.26189 * h), controlPoint2:CGPoint(x:minX + 0.06666 * w, y: minY + 0.198 * h))
		GoatWithCrownPathPath.addLine(to: CGPoint(x:minX + 0.09443 * w, y: minY + 0.40167 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.18076 * w, y: minY + 0.82444 * h), controlPoint1:CGPoint(x:minX + 0.09443 * w, y: minY + 0.40167 * h), controlPoint2:CGPoint(x:minX + 0.14743 * w, y: minY + 0.59878 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.22931 * w, y: minY + 0.74233 * h), controlPoint1:CGPoint(x:minX + 0.20609 * w, y: minY + 0.79256 * h), controlPoint2:CGPoint(x:minX + 0.21798 * w, y: minY + 0.767 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.23953 * w, y: minY + 0.72067 * h), controlPoint1:CGPoint(x:minX + 0.23264 * w, y: minY + 0.735 * h), controlPoint2:CGPoint(x:minX + 0.23597 * w, y: minY + 0.72778 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.24342 * w, y: minY + 0.705 * h), controlPoint1:CGPoint(x:minX + 0.2402 * w, y: minY + 0.71878 * h), controlPoint2:CGPoint(x:minX + 0.24208 * w, y: minY + 0.71089 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.33174 * w, y: minY + 0.56567 * h), controlPoint1:CGPoint(x:minX + 0.25164 * w, y: minY + 0.66944 * h), controlPoint2:CGPoint(x:minX + 0.26808 * w, y: minY + 0.599 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.31474 * w, y: minY + 0.44233 * h), controlPoint1:CGPoint(x:minX + 0.3313 * w, y: minY + 0.53578 * h), controlPoint2:CGPoint(x:minX + 0.32552 * w, y: minY + 0.493 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.31219 * w, y: minY + 0.434 * h), controlPoint1:CGPoint(x:minX + 0.31419 * w, y: minY + 0.44078 * h), controlPoint2:CGPoint(x:minX + 0.3133 * w, y: minY + 0.43789 * h))
		GoatWithCrownPathPath.addLine(to: CGPoint(x:minX + 0.31219 * w, y: minY + 0.434 * h))
		GoatWithCrownPathPath.close()
		GoatWithCrownPathPath.move(to: CGPoint(x:minX + 0.75647 * w, y: minY + 0.36944 * h))
		GoatWithCrownPathPath.addLine(to: CGPoint(x:minX + 0.7157 * w, y: minY + 0.16011 * h))
		GoatWithCrownPathPath.addLine(to: CGPoint(x:minX + 0.61293 * w, y: minY + 0.31311 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.6216 * w, y: minY + 0.31833 * h), controlPoint1:CGPoint(x:minX + 0.61504 * w, y: minY + 0.31433 * h), controlPoint2:CGPoint(x:minX + 0.61771 * w, y: minY + 0.31589 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.67215 * w, y: minY + 0.35922 * h), controlPoint1:CGPoint(x:minX + 0.63349 * w, y: minY + 0.32267 * h), controlPoint2:CGPoint(x:minX + 0.66026 * w, y: minY + 0.33478 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.67137 * w, y: minY + 0.42756 * h), controlPoint1:CGPoint(x:minX + 0.68337 * w, y: minY + 0.37933 * h), controlPoint2:CGPoint(x:minX + 0.68315 * w, y: minY + 0.40644 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.66359 * w, y: minY + 0.43733 * h), controlPoint1:CGPoint(x:minX + 0.6697 * w, y: minY + 0.43044 * h), controlPoint2:CGPoint(x:minX + 0.66726 * w, y: minY + 0.434 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.65593 * w, y: minY + 0.44978 * h), controlPoint1:CGPoint(x:minX + 0.66137 * w, y: minY + 0.44156 * h), controlPoint2:CGPoint(x:minX + 0.65882 * w, y: minY + 0.44589 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.65759 * w, y: minY + 0.46122 * h), controlPoint1:CGPoint(x:minX + 0.65648 * w, y: minY + 0.45444 * h), controlPoint2:CGPoint(x:minX + 0.65704 * w, y: minY + 0.45822 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.67204 * w, y: minY + 0.48833 * h), controlPoint1:CGPoint(x:minX + 0.66693 * w, y: minY + 0.46778 * h), controlPoint2:CGPoint(x:minX + 0.67181 * w, y: minY + 0.47822 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.70248 * w, y: minY + 0.473 * h), controlPoint1:CGPoint(x:minX + 0.68226 * w, y: minY + 0.482 * h), controlPoint2:CGPoint(x:minX + 0.69248 * w, y: minY + 0.47678 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.73381 * w, y: minY + 0.46522 * h), controlPoint1:CGPoint(x:minX + 0.71459 * w, y: minY + 0.46844 * h), controlPoint2:CGPoint(x:minX + 0.71914 * w, y: minY + 0.46944 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.74536 * w, y: minY + 0.46256 * h), controlPoint1:CGPoint(x:minX + 0.73703 * w, y: minY + 0.46433 * h), controlPoint2:CGPoint(x:minX + 0.74247 * w, y: minY + 0.46233 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.76014 * w, y: minY + 0.46289 * h), controlPoint1:CGPoint(x:minX + 0.74536 * w, y: minY + 0.46256 * h), controlPoint2:CGPoint(x:minX + 0.75203 * w, y: minY + 0.45967 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.7778 * w, y: minY + 0.48522 * h), controlPoint1:CGPoint(x:minX + 0.76814 * w, y: minY + 0.46611 * h), controlPoint2:CGPoint(x:minX + 0.7778 * w, y: minY + 0.48522 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.86546 * w, y: minY + 0.57267 * h), controlPoint1:CGPoint(x:minX + 0.79125 * w, y: minY + 0.50856 * h), controlPoint2:CGPoint(x:minX + 0.8308 * w, y: minY + 0.546 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.90579 * w, y: minY + 0.40156 * h), controlPoint1:CGPoint(x:minX + 0.88746 * w, y: minY + 0.47011 * h), controlPoint2:CGPoint(x:minX + 0.90579 * w, y: minY + 0.40156 * h))
		GoatWithCrownPathPath.addLine(to: CGPoint(x:minX + w, y: minY + 0.13611 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.75647 * w, y: minY + 0.36944 * h), controlPoint1:CGPoint(x:minX + 0.9059 * w, y: minY + 0.22367 * h), controlPoint2:CGPoint(x:minX + 0.82324 * w, y: minY + 0.31544 * h))
		GoatWithCrownPathPath.addLine(to: CGPoint(x:minX + 0.75647 * w, y: minY + 0.36944 * h))
		GoatWithCrownPathPath.close()
		GoatWithCrownPathPath.move(to: CGPoint(x:minX + 0.3073 * w, y: minY + 0.27556 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.31896 * w, y: minY + 0.26056 * h), controlPoint1:CGPoint(x:minX + 0.31074 * w, y: minY + 0.27011 * h), controlPoint2:CGPoint(x:minX + 0.31463 * w, y: minY + 0.26511 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.31185 * w, y: minY + 0.23211 * h), controlPoint1:CGPoint(x:minX + 0.31763 * w, y: minY + 0.25222 * h), controlPoint2:CGPoint(x:minX + 0.31552 * w, y: minY + 0.24222 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.28786 * w, y: minY + 0.18922 * h), controlPoint1:CGPoint(x:minX + 0.30441 * w, y: minY + 0.21122 * h), controlPoint2:CGPoint(x:minX + 0.29519 * w, y: minY + 0.19911 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.28064 * w, y: minY + 0.179 * h), controlPoint1:CGPoint(x:minX + 0.2853 * w, y: minY + 0.18578 * h), controlPoint2:CGPoint(x:minX + 0.28286 * w, y: minY + 0.18244 * h))
		GoatWithCrownPathPath.addLine(to: CGPoint(x:minX + 0.2613 * w, y: minY + 0.27844 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.28197 * w, y: minY + 0.27589 * h), controlPoint1:CGPoint(x:minX + 0.26808 * w, y: minY + 0.27733 * h), controlPoint2:CGPoint(x:minX + 0.27486 * w, y: minY + 0.27644 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.3073 * w, y: minY + 0.27556 * h), controlPoint1:CGPoint(x:minX + 0.2903 * w, y: minY + 0.27544 * h), controlPoint2:CGPoint(x:minX + 0.29874 * w, y: minY + 0.27533 * h))
		GoatWithCrownPathPath.addLine(to: CGPoint(x:minX + 0.3073 * w, y: minY + 0.27556 * h))
		GoatWithCrownPathPath.close()
		GoatWithCrownPathPath.move(to: CGPoint(x:minX + 0.53439 * w, y: minY + 0.45978 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.53483 * w, y: minY + 0.45867 * h), controlPoint1:CGPoint(x:minX + 0.5345 * w, y: minY + 0.45944 * h), controlPoint2:CGPoint(x:minX + 0.53472 * w, y: minY + 0.459 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.51928 * w, y: minY + 0.45867 * h), controlPoint1:CGPoint(x:minX + 0.52972 * w, y: minY + 0.45889 * h), controlPoint2:CGPoint(x:minX + 0.5245 * w, y: minY + 0.45889 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.5285 * w, y: minY + 0.47889 * h), controlPoint1:CGPoint(x:minX + 0.52205 * w, y: minY + 0.46589 * h), controlPoint2:CGPoint(x:minX + 0.52516 * w, y: minY + 0.47267 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.53439 * w, y: minY + 0.45978 * h), controlPoint1:CGPoint(x:minX + 0.52983 * w, y: minY + 0.47133 * h), controlPoint2:CGPoint(x:minX + 0.53239 * w, y: minY + 0.465 * h))
		GoatWithCrownPathPath.addLine(to: CGPoint(x:minX + 0.53439 * w, y: minY + 0.45978 * h))
		GoatWithCrownPathPath.close()
		GoatWithCrownPathPath.move(to: CGPoint(x:minX + 0.57671 * w, y: minY + 0.28233 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.55249 * w, y: minY + 0.20089 * h), controlPoint1:CGPoint(x:minX + 0.56805 * w, y: minY + 0.25344 * h), controlPoint2:CGPoint(x:minX + 0.55983 * w, y: minY + 0.22533 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.50006 * w, y: minY), controlPoint1:CGPoint(x:minX + 0.51816 * w, y: minY + 0.08622 * h), controlPoint2:CGPoint(x:minX + 0.50006 * w, y: minY))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.46062 * w, y: minY + 0.15622 * h), controlPoint1:CGPoint(x:minX + 0.50006 * w, y: minY), controlPoint2:CGPoint(x:minX + 0.4865 * w, y: minY + 0.06456 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.47817 * w, y: minY + 0.19922 * h), controlPoint1:CGPoint(x:minX + 0.46639 * w, y: minY + 0.168 * h), controlPoint2:CGPoint(x:minX + 0.47206 * w, y: minY + 0.18233 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.48195 * w, y: minY + 0.20944 * h), controlPoint1:CGPoint(x:minX + 0.47928 * w, y: minY + 0.20233 * h), controlPoint2:CGPoint(x:minX + 0.48061 * w, y: minY + 0.20578 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.48917 * w, y: minY + 0.22922 * h), controlPoint1:CGPoint(x:minX + 0.48439 * w, y: minY + 0.21611 * h), controlPoint2:CGPoint(x:minX + 0.48695 * w, y: minY + 0.22278 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.57116 * w, y: minY + 0.27733 * h), controlPoint1:CGPoint(x:minX + 0.51694 * w, y: minY + 0.23778 * h), controlPoint2:CGPoint(x:minX + 0.54394 * w, y: minY + 0.25367 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.57671 * w, y: minY + 0.28233 * h), controlPoint1:CGPoint(x:minX + 0.57305 * w, y: minY + 0.27911 * h), controlPoint2:CGPoint(x:minX + 0.57494 * w, y: minY + 0.28078 * h))
		GoatWithCrownPathPath.addLine(to: CGPoint(x:minX + 0.57671 * w, y: minY + 0.28233 * h))
		GoatWithCrownPathPath.close()
		GoatWithCrownPathPath.move(to: CGPoint(x:minX + 0.71925 * w, y: minY + 0.62456 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.69559 * w, y: minY + 0.67289 * h), controlPoint1:CGPoint(x:minX + 0.71281 * w, y: minY + 0.64122 * h), controlPoint2:CGPoint(x:minX + 0.70492 * w, y: minY + 0.65733 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.71959 * w, y: minY + 0.67022 * h), controlPoint1:CGPoint(x:minX + 0.70381 * w, y: minY + 0.67167 * h), controlPoint2:CGPoint(x:minX + 0.71181 * w, y: minY + 0.67078 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.74914 * w, y: minY + 0.67033 * h), controlPoint1:CGPoint(x:minX + 0.73059 * w, y: minY + 0.66944 * h), controlPoint2:CGPoint(x:minX + 0.74025 * w, y: minY + 0.66944 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.78991 * w, y: minY + 0.68222 * h), controlPoint1:CGPoint(x:minX + 0.75725 * w, y: minY + 0.67111 * h), controlPoint2:CGPoint(x:minX + 0.77536 * w, y: minY + 0.673 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.80569 * w, y: minY + 0.69589 * h), controlPoint1:CGPoint(x:minX + 0.78991 * w, y: minY + 0.68222 * h), controlPoint2:CGPoint(x:minX + 0.80247 * w, y: minY + 0.69022 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.81102 * w, y: minY + 0.715 * h), controlPoint1:CGPoint(x:minX + 0.80891 * w, y: minY + 0.70156 * h), controlPoint2:CGPoint(x:minX + 0.81102 * w, y: minY + 0.715 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.82669 * w, y: minY + 0.77778 * h), controlPoint1:CGPoint(x:minX + 0.81191 * w, y: minY + 0.73022 * h), controlPoint2:CGPoint(x:minX + 0.81813 * w, y: minY + 0.75344 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.84391 * w, y: minY + 0.67944 * h), controlPoint1:CGPoint(x:minX + 0.83213 * w, y: minY + 0.74378 * h), controlPoint2:CGPoint(x:minX + 0.83802 * w, y: minY + 0.71089 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.73503 * w, y: minY + 0.60689 * h), controlPoint1:CGPoint(x:minX + 0.80924 * w, y: minY + 0.64522 * h), controlPoint2:CGPoint(x:minX + 0.76358 * w, y: minY + 0.62078 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.71925 * w, y: minY + 0.62456 * h), controlPoint1:CGPoint(x:minX + 0.72781 * w, y: minY + 0.61211 * h), controlPoint2:CGPoint(x:minX + 0.72203 * w, y: minY + 0.61756 * h))
		GoatWithCrownPathPath.addLine(to: CGPoint(x:minX + 0.71925 * w, y: minY + 0.62456 * h))
		GoatWithCrownPathPath.close()
		GoatWithCrownPathPath.move(to: CGPoint(x:minX + 0.96012 * w, y: minY + 0.67111 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.87501 * w, y: minY + 0.61922 * h), controlPoint1:CGPoint(x:minX + 0.93079 * w, y: minY + 0.65456 * h), controlPoint2:CGPoint(x:minX + 0.87501 * w, y: minY + 0.61922 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.74958 * w, y: minY + 0.50156 * h), controlPoint1:CGPoint(x:minX + 0.83657 * w, y: minY + 0.59489 * h), controlPoint2:CGPoint(x:minX + 0.77103 * w, y: minY + 0.53856 * h))
		GoatWithCrownPathPath.addLine(to: CGPoint(x:minX + 0.74914 * w, y: minY + 0.50189 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.71392 * w, y: minY + 0.50344 * h), controlPoint1:CGPoint(x:minX + 0.7447 * w, y: minY + 0.49644 * h), controlPoint2:CGPoint(x:minX + 0.73481 * w, y: minY + 0.49544 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.5826 * w, y: minY + 0.59533 * h), controlPoint1:CGPoint(x:minX + 0.67315 * w, y: minY + 0.51889 * h), controlPoint2:CGPoint(x:minX + 0.61982 * w, y: minY + 0.57122 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.48095 * w, y: minY + 0.44533 * h), controlPoint1:CGPoint(x:minX + 0.56727 * w, y: minY + 0.56678 * h), controlPoint2:CGPoint(x:minX + 0.50428 * w, y: minY + 0.53456 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.47739 * w, y: minY + 0.42956 * h), controlPoint1:CGPoint(x:minX + 0.47961 * w, y: minY + 0.44022 * h), controlPoint2:CGPoint(x:minX + 0.47839 * w, y: minY + 0.435 * h))
		GoatWithCrownPathPath.addLine(to: CGPoint(x:minX + 0.47728 * w, y: minY + 0.42944 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.47717 * w, y: minY + 0.42733 * h), controlPoint1:CGPoint(x:minX + 0.47728 * w, y: minY + 0.42878 * h), controlPoint2:CGPoint(x:minX + 0.47728 * w, y: minY + 0.428 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.47995 * w, y: minY + 0.41889 * h), controlPoint1:CGPoint(x:minX + 0.47772 * w, y: minY + 0.424 * h), controlPoint2:CGPoint(x:minX + 0.47906 * w, y: minY + 0.42156 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.55994 * w, y: minY + 0.42178 * h), controlPoint1:CGPoint(x:minX + 0.51628 * w, y: minY + 0.42956 * h), controlPoint2:CGPoint(x:minX + 0.54094 * w, y: minY + 0.42711 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.56727 * w, y: minY + 0.44267 * h), controlPoint1:CGPoint(x:minX + 0.56194 * w, y: minY + 0.42878 * h), controlPoint2:CGPoint(x:minX + 0.56483 * w, y: minY + 0.43667 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.56016 * w, y: minY + 0.48878 * h), controlPoint1:CGPoint(x:minX + 0.5746 * w, y: minY + 0.46033 * h), controlPoint2:CGPoint(x:minX + 0.55994 * w, y: minY + 0.47411 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.58905 * w, y: minY + 0.53878 * h), controlPoint1:CGPoint(x:minX + 0.56038 * w, y: minY + 0.50344 * h), controlPoint2:CGPoint(x:minX + 0.58127 * w, y: minY + 0.53267 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.5906 * w, y: minY + 0.49233 * h), controlPoint1:CGPoint(x:minX + 0.59916 * w, y: minY + 0.54667 * h), controlPoint2:CGPoint(x:minX + 0.57727 * w, y: minY + 0.50356 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.60316 * w, y: minY + 0.45433 * h), controlPoint1:CGPoint(x:minX + 0.60116 * w, y: minY + 0.48344 * h), controlPoint2:CGPoint(x:minX + 0.60138 * w, y: minY + 0.45878 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.61871 * w, y: minY + 0.48344 * h), controlPoint1:CGPoint(x:minX + 0.60793 * w, y: minY + 0.46511 * h), controlPoint2:CGPoint(x:minX + 0.61526 * w, y: minY + 0.47678 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.63515 * w, y: minY + 0.487 * h), controlPoint1:CGPoint(x:minX + 0.62826 * w, y: minY + 0.50133 * h), controlPoint2:CGPoint(x:minX + 0.64837 * w, y: minY + 0.48744 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.62226 * w, y: minY + 0.43889 * h), controlPoint1:CGPoint(x:minX + 0.62604 * w, y: minY + 0.48667 * h), controlPoint2:CGPoint(x:minX + 0.62304 * w, y: minY + 0.45 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.63737 * w, y: minY + 0.41589 * h), controlPoint1:CGPoint(x:minX + 0.6296 * w, y: minY + 0.43244 * h), controlPoint2:CGPoint(x:minX + 0.63526 * w, y: minY + 0.423 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.64304 * w, y: minY + 0.41167 * h), controlPoint1:CGPoint(x:minX + 0.63982 * w, y: minY + 0.415 * h), controlPoint2:CGPoint(x:minX + 0.64182 * w, y: minY + 0.41367 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.64326 * w, y: minY + 0.37422 * h), controlPoint1:CGPoint(x:minX + 0.64993 * w, y: minY + 0.39933 * h), controlPoint2:CGPoint(x:minX + 0.64926 * w, y: minY + 0.38389 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.6076 * w, y: minY + 0.34778 * h), controlPoint1:CGPoint(x:minX + 0.63548 * w, y: minY + 0.35633 * h), controlPoint2:CGPoint(x:minX + 0.6076 * w, y: minY + 0.34778 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.54972 * w, y: minY + 0.30178 * h), controlPoint1:CGPoint(x:minX + 0.57894 * w, y: minY + 0.32967 * h), controlPoint2:CGPoint(x:minX + 0.6056 * w, y: minY + 0.35044 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.46284 * w, y: minY + 0.25611 * h), controlPoint1:CGPoint(x:minX + 0.51761 * w, y: minY + 0.27378 * h), controlPoint2:CGPoint(x:minX + 0.48895 * w, y: minY + 0.26078 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.46273 * w, y: minY + 0.25422 * h), controlPoint1:CGPoint(x:minX + 0.46284 * w, y: minY + 0.25544 * h), controlPoint2:CGPoint(x:minX + 0.46295 * w, y: minY + 0.25489 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.44751 * w, y: minY + 0.21011 * h), controlPoint1:CGPoint(x:minX + 0.46006 * w, y: minY + 0.24289 * h), controlPoint2:CGPoint(x:minX + 0.45251 * w, y: minY + 0.22389 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.41373 * w, y: minY + 0.14744 * h), controlPoint1:CGPoint(x:minX + 0.43728 * w, y: minY + 0.18156 * h), controlPoint2:CGPoint(x:minX + 0.42506 * w, y: minY + 0.15211 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.40084 * w, y: minY + 0.15767 * h), controlPoint1:CGPoint(x:minX + 0.40895 * w, y: minY + 0.14556 * h), controlPoint2:CGPoint(x:minX + 0.40062 * w, y: minY + 0.14722 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.41829 * w, y: minY + 0.21556 * h), controlPoint1:CGPoint(x:minX + 0.40096 * w, y: minY + 0.16622 * h), controlPoint2:CGPoint(x:minX + 0.41407 * w, y: minY + 0.18144 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.41706 * w, y: minY + 0.25544 * h), controlPoint1:CGPoint(x:minX + 0.42006 * w, y: minY + 0.23067 * h), controlPoint2:CGPoint(x:minX + 0.41873 * w, y: minY + 0.24522 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.40951 * w, y: minY + 0.25667 * h), controlPoint1:CGPoint(x:minX + 0.41451 * w, y: minY + 0.25578 * h), controlPoint2:CGPoint(x:minX + 0.41195 * w, y: minY + 0.25622 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.38162 * w, y: minY + 0.20856 * h), controlPoint1:CGPoint(x:minX + 0.40229 * w, y: minY + 0.24322 * h), controlPoint2:CGPoint(x:minX + 0.38873 * w, y: minY + 0.22289 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.31774 * w, y: minY + 0.13889 * h), controlPoint1:CGPoint(x:minX + 0.36463 * w, y: minY + 0.17422 * h), controlPoint2:CGPoint(x:minX + 0.3333 * w, y: minY + 0.13978 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.30474 * w, y: minY + 0.155 * h), controlPoint1:CGPoint(x:minX + 0.31263 * w, y: minY + 0.13856 * h), controlPoint2:CGPoint(x:minX + 0.30152 * w, y: minY + 0.13944 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.3423 * w, y: minY + 0.22122 * h), controlPoint1:CGPoint(x:minX + 0.30697 * w, y: minY + 0.16556 * h), controlPoint2:CGPoint(x:minX + 0.32774 * w, y: minY + 0.18056 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.35296 * w, y: minY + 0.27422 * h), controlPoint1:CGPoint(x:minX + 0.34974 * w, y: minY + 0.242 * h), controlPoint2:CGPoint(x:minX + 0.35218 * w, y: minY + 0.26211 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.34963 * w, y: minY + 0.27667 * h), controlPoint1:CGPoint(x:minX + 0.35174 * w, y: minY + 0.275 * h), controlPoint2:CGPoint(x:minX + 0.35063 * w, y: minY + 0.27578 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.32685 * w, y: minY + 0.30956 * h), controlPoint1:CGPoint(x:minX + 0.33874 * w, y: minY + 0.28467 * h), controlPoint2:CGPoint(x:minX + 0.33096 * w, y: minY + 0.29678 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.23109 * w, y: minY + 0.32078 * h), controlPoint1:CGPoint(x:minX + 0.30319 * w, y: minY + 0.30678 * h), controlPoint2:CGPoint(x:minX + 0.26508 * w, y: minY + 0.30589 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.22653 * w, y: minY + 0.374 * h), controlPoint1:CGPoint(x:minX + 0.17509 * w, y: minY + 0.34533 * h), controlPoint2:CGPoint(x:minX + 0.19109 * w, y: minY + 0.36211 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.29041 * w, y: minY + 0.37289 * h), controlPoint1:CGPoint(x:minX + 0.26308 * w, y: minY + 0.38633 * h), controlPoint2:CGPoint(x:minX + 0.2743 * w, y: minY + 0.37733 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.32396 * w, y: minY + 0.35678 * h), controlPoint1:CGPoint(x:minX + 0.29786 * w, y: minY + 0.37078 * h), controlPoint2:CGPoint(x:minX + 0.31141 * w, y: minY + 0.36378 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.34307 * w, y: minY + 0.42422 * h), controlPoint1:CGPoint(x:minX + 0.32841 * w, y: minY + 0.38067 * h), controlPoint2:CGPoint(x:minX + 0.33785 * w, y: minY + 0.40933 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.34596 * w, y: minY + 0.43433 * h), controlPoint1:CGPoint(x:minX + 0.34474 * w, y: minY + 0.43022 * h), controlPoint2:CGPoint(x:minX + 0.34585 * w, y: minY + 0.434 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.36318 * w, y: minY + 0.58733 * h), controlPoint1:CGPoint(x:minX + 0.35629 * w, y: minY + 0.48289 * h), controlPoint2:CGPoint(x:minX + 0.36685 * w, y: minY + 0.54622 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.2683 * w, y: minY + 0.73511 * h), controlPoint1:CGPoint(x:minX + 0.2813 * w, y: minY + 0.61489 * h), controlPoint2:CGPoint(x:minX + 0.27875 * w, y: minY + 0.714 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.19998 * w, y: minY + 0.85211 * h), controlPoint1:CGPoint(x:minX + 0.25175 * w, y: minY + 0.76844 * h), controlPoint2:CGPoint(x:minX + 0.2402 * w, y: minY + 0.80367 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.11554 * w, y: minY + 0.93922 * h), controlPoint1:CGPoint(x:minX + 0.18254 * w, y: minY + 0.87311 * h), controlPoint2:CGPoint(x:minX + 0.12721 * w, y: minY + 0.92467 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.08866 * w, y: minY + 0.96133 * h), controlPoint1:CGPoint(x:minX + 0.09999 * w, y: minY + 0.95856 * h), controlPoint2:CGPoint(x:minX + 0.10732 * w, y: minY + 0.98011 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.07877 * w, y: minY + 0.95322 * h), controlPoint1:CGPoint(x:minX + 0.08799 * w, y: minY + 0.96067 * h), controlPoint2:CGPoint(x:minX + 0.07955 * w, y: minY + 0.95389 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.02178 * w, y: minY + 0.93356 * h), controlPoint1:CGPoint(x:minX + 0.05333 * w, y: minY + 0.93533 * h), controlPoint2:CGPoint(x:minX + 0.03855 * w, y: minY + 0.93356 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX, y: minY + 0.93767 * h), controlPoint1:CGPoint(x:minX + 0.014 * w, y: minY + 0.93356 * h), controlPoint2:CGPoint(x:minX + 0.00678 * w, y: minY + 0.93522 * h))
		GoatWithCrownPathPath.addLine(to: CGPoint(x:minX, y: minY + 0.99478 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.08666 * w, y: minY + h), controlPoint1:CGPoint(x:minX + 0.04211 * w, y: minY + 0.97722 * h), controlPoint2:CGPoint(x:minX + 0.07532 * w, y: minY + 0.98189 * h))
		GoatWithCrownPathPath.addLine(to: CGPoint(x:minX + 0.39973 * w, y: minY + h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.43029 * w, y: minY + 0.96956 * h), controlPoint1:CGPoint(x:minX + 0.40929 * w, y: minY + 0.98822 * h), controlPoint2:CGPoint(x:minX + 0.41973 * w, y: minY + 0.97733 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.53016 * w, y: minY + 0.86667 * h), controlPoint1:CGPoint(x:minX + 0.4595 * w, y: minY + 0.94822 * h), controlPoint2:CGPoint(x:minX + 0.50061 * w, y: minY + 0.92189 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.6747 * w, y: minY + 0.78933 * h), controlPoint1:CGPoint(x:minX + 0.57882 * w, y: minY + 0.85822 * h), controlPoint2:CGPoint(x:minX + 0.63948 * w, y: minY + 0.838 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.72903 * w, y: minY + 0.76833 * h), controlPoint1:CGPoint(x:minX + 0.68826 * w, y: minY + 0.77056 * h), controlPoint2:CGPoint(x:minX + 0.71037 * w, y: minY + 0.76956 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.81758 * w, y: minY + 0.99456 * h), controlPoint1:CGPoint(x:minX + 0.76503 * w, y: minY + 0.81678 * h), controlPoint2:CGPoint(x:minX + 0.82224 * w, y: minY + 0.91 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.86446 * w, y: minY + 0.998 * h), controlPoint1:CGPoint(x:minX + 0.81758 * w, y: minY + 0.99456 * h), controlPoint2:CGPoint(x:minX + 0.84302 * w, y: minY + 1.00311 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.89135 * w, y: minY + 0.96256 * h), controlPoint1:CGPoint(x:minX + 0.88068 * w, y: minY + 0.99411 * h), controlPoint2:CGPoint(x:minX + 0.90323 * w, y: minY + 0.97456 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.83746 * w, y: minY + 0.88056 * h), controlPoint1:CGPoint(x:minX + 0.86757 * w, y: minY + 0.93867 * h), controlPoint2:CGPoint(x:minX + 0.83746 * w, y: minY + 0.88056 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.77858 * w, y: minY + 0.71689 * h), controlPoint1:CGPoint(x:minX + 0.8138 * w, y: minY + 0.84167 * h), controlPoint2:CGPoint(x:minX + 0.78125 * w, y: minY + 0.75967 * h))
		GoatWithCrownPathPath.addLine(to: CGPoint(x:minX + 0.77814 * w, y: minY + 0.717 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.74592 * w, y: minY + 0.70256 * h), controlPoint1:CGPoint(x:minX + 0.77669 * w, y: minY + 0.71011 * h), controlPoint2:CGPoint(x:minX + 0.76825 * w, y: minY + 0.70489 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.61571 * w, y: minY + 0.72167 * h), controlPoint1:CGPoint(x:minX + 0.71092 * w, y: minY + 0.699 * h), controlPoint2:CGPoint(x:minX + 0.65804 * w, y: minY + 0.71333 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.68915 * w, y: minY + 0.61267 * h), controlPoint1:CGPoint(x:minX + 0.64326 * w, y: minY + 0.69467 * h), controlPoint2:CGPoint(x:minX + 0.67126 * w, y: minY + 0.65844 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.73214 * w, y: minY + 0.56956 * h), controlPoint1:CGPoint(x:minX + 0.69781 * w, y: minY + 0.59056 * h), controlPoint2:CGPoint(x:minX + 0.71736 * w, y: minY + 0.57967 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.9119 * w, y: minY + 0.71989 * h), controlPoint1:CGPoint(x:minX + 0.7878 * w, y: minY + 0.59533 * h), controlPoint2:CGPoint(x:minX + 0.87901 * w, y: minY + 0.64333 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.94901 * w, y: minY + 0.71222 * h), controlPoint1:CGPoint(x:minX + 0.9119 * w, y: minY + 0.71989 * h), controlPoint2:CGPoint(x:minX + 0.93367 * w, y: minY + 0.72778 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.96012 * w, y: minY + 0.67111 * h), controlPoint1:CGPoint(x:minX + 0.96056 * w, y: minY + 0.70056 * h), controlPoint2:CGPoint(x:minX + 0.96545 * w, y: minY + 0.67422 * h))
		GoatWithCrownPathPath.addLine(to: CGPoint(x:minX + 0.96012 * w, y: minY + 0.67111 * h))
		GoatWithCrownPathPath.close()
		GoatWithCrownPathPath.move(to: CGPoint(x:minX + 0.45228 * w, y: minY + 0.31856 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.44506 * w, y: minY + 0.30411 * h), controlPoint1:CGPoint(x:minX + 0.44617 * w, y: minY + 0.31333 * h), controlPoint2:CGPoint(x:minX + 0.44195 * w, y: minY + 0.30922 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.51305 * w, y: minY + 0.32544 * h), controlPoint1:CGPoint(x:minX + 0.44806 * w, y: minY + 0.299 * h), controlPoint2:CGPoint(x:minX + 0.51061 * w, y: minY + 0.28589 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.50172 * w, y: minY + 0.33544 * h), controlPoint1:CGPoint(x:minX + 0.5135 * w, y: minY + 0.33289 * h), controlPoint2:CGPoint(x:minX + 0.50694 * w, y: minY + 0.33422 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.47073 * w, y: minY + 0.33056 * h), controlPoint1:CGPoint(x:minX + 0.48939 * w, y: minY + 0.33833 * h), controlPoint2:CGPoint(x:minX + 0.47073 * w, y: minY + 0.33056 * h))
		GoatWithCrownPathPath.addCurve(to: CGPoint(x:minX + 0.45228 * w, y: minY + 0.31856 * h), controlPoint1:CGPoint(x:minX + 0.47073 * w, y: minY + 0.33056 * h), controlPoint2:CGPoint(x:minX + 0.46117 * w, y: minY + 0.32633 * h))
		GoatWithCrownPathPath.addLine(to: CGPoint(x:minX + 0.45228 * w, y: minY + 0.31856 * h))
		GoatWithCrownPathPath.close()
		GoatWithCrownPathPath.move(to: CGPoint(x:minX + 0.45228 * w, y: minY + 0.31856 * h))
		
		return GoatWithCrownPathPath
	}
	
	
}
