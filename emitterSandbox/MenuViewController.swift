//
//  MenuViewController.swift
//  emitterSandbox
//
//  Created by Joris ZEFIRINI on 17/11/2017.
//  Copyright © 2017 SoniWeb. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    // Déclaration de nos outlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var sldEmitterBirthrate: customSlider!
    @IBOutlet weak var sldPositionRangeX: customSlider!
    @IBOutlet weak var sldPositionRangeY: customSlider!
    @IBOutlet weak var sldAngleStart: customSlider!
    @IBOutlet weak var sldAngleRange: customSlider!
    @IBOutlet weak var sldSpeedStart: customSlider!
    @IBOutlet weak var sldSpeedRange: customSlider!
    @IBOutlet weak var sldAccelerationX: customSlider!
    @IBOutlet weak var sldAccelerationY: customSlider!
    @IBOutlet weak var sldAlphaStart: customSlider!
    @IBOutlet weak var sldAlphaRange: customSlider!
    @IBOutlet weak var sldAlphaSpeed: customSlider!
    @IBOutlet weak var sldScaleStart: customSlider!
    @IBOutlet weak var sldScaleRange: customSlider!
    @IBOutlet weak var sldScaleSpeed: customSlider!
    @IBOutlet weak var sldRotationStart: customSlider!
    @IBOutlet weak var sldRotationRange: customSlider!
    @IBOutlet weak var sldRotationSpeed: customSlider!
    
    
    // Déclarations de nos variables
    var parentController : EmitterViewController!
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        var contentSize : CGFloat = 0
        
        // On cherche l'élémeent le plus bas pour définir la zone de scroll
        for v in self.view.subviews{
            if(contentSize < v.frame.origin.y + v.frame.height){
                contentSize = v.frame.origin.y + v.frame.height
                print(v.frame.maxY)
                print(contentSize)
            }
        }
        
        // On défini la zone de scroll
        // +44 pour la marge de la navigation bar
        // +31 marge souhaitée en bas
        scrollView.contentSize.height = contentSize + 44 + 31
    
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.clear
        
        // On configure la hauteur de notre scroll
        

        
        //On configure si notre slider retourne un angle ou non
        sldAngleStart.isAngle = true
        sldAngleRange.isAngle = true
        sldRotationStart.isAngle = true
        sldRotationRange.isAngle = true
        sldRotationSpeed.isAngle = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Fonction qui met à jour nos sliders en fonction du type choisi
    // Cette fonction est appelé à chaque chargement d'un type d'Emitter
    // Il est inutile de l'appeler à chaque ouverture de menu
    func updateSliderFrom(){
        sldEmitterBirthrate.value = Float(customEmitter.config["EMITTER_BIRTHRATE"] as! CGFloat)
        sldPositionRangeX.value = Float(customEmitter.config["POSITION_RANGE_X"] as! CGFloat)
        sldPositionRangeY.value = Float(customEmitter.config["POSITION_RANGE_Y"] as! CGFloat)
        sldAngleStart.value = Float(customEmitter.config["ANGLE_START"] as! CGFloat)
        sldAngleRange.value = Float(customEmitter.config["ANGLE_RANGE"] as! CGFloat)
        sldSpeedStart.value = Float(customEmitter.config["SPEED_START"] as! CGFloat)
        sldSpeedRange.value = Float(customEmitter.config["SPEED_RANGE"] as! CGFloat)
        sldAccelerationX.value = Float(customEmitter.config["ACCELERATION_X"] as! CGFloat)
        sldAccelerationY.value = Float(customEmitter.config["ACCELERATION_Y"] as! CGFloat)
        sldAlphaStart.value = Float(customEmitter.config["ALPHA_START"] as! CGFloat)
        sldAlphaRange.value = Float(customEmitter.config["ALPHA_RANGE"] as! CGFloat)
        sldAlphaSpeed.value = Float(customEmitter.config["ALPHA_SPEED"] as! CGFloat)
        sldScaleStart.value = Float(customEmitter.config["SCALE_START"] as! CGFloat)
        sldScaleRange.value = Float(customEmitter.config["SCALE_RANGE"] as! CGFloat)
        sldScaleSpeed.value = Float(customEmitter.config["SCALE_SPEED"] as! CGFloat)
        sldRotationStart.value = Float(customEmitter.config["ROTATION_START"] as! CGFloat)
        sldRotationRange.value = Float(customEmitter.config["ROTATION_RANGE"] as! CGFloat)
        sldRotationSpeed.value = Float(customEmitter.config["ROTATION_SPEED"] as! CGFloat)

    }
    
    // Actions de nos sliders
    // Birthrate
    @IBAction func actEmitterBirthrate(_ sender: Any) {
        let value = CGFloat(sldEmitterBirthrate.value)
        customEmitter.config["EMITTER_BIRTHRATE"] = value
        parentController.scene.currentEmitter.particleBirthRate = value
    }
    
    // Position Range X
    @IBAction func actPositionRangeX(_ sender: Any) {
        let value = CGFloat(sldPositionRangeX.value)
        customEmitter.config["POSITION_RANGE_X"] = value
        parentController.scene.currentEmitter.particlePositionRange.dx = value
    }
    
    // Position Range Y
    @IBAction func actPositionRangeY(_ sender: Any) {
        let value = CGFloat(sldPositionRangeY.value)
        customEmitter.config["POSITION_RANGE_Y"] = value
        parentController.scene.currentEmitter.particlePositionRange.dy = value
    }
    
    // Angle Start
    @IBAction func actAngleStart(_ sender: Any) {
        let value = CGFloat(sldAngleStart.value)
        customEmitter.config["ANGLE_START"] = value
        parentController.scene.currentEmitter.emissionAngle = value
    }
    
    // Angle Range
    @IBAction func actAngleRange(_ sender: Any) {
        let value = CGFloat(sldAngleRange.value)
        customEmitter.config["ANGLE_RANGE"] = value
        parentController.scene.currentEmitter.emissionAngleRange = value
    }
    
    // Speed Start
    @IBAction func actSpeedStart(_ sender: Any) {
        let value = CGFloat(sldSpeedStart.value)
        customEmitter.config["SPEED_START"] = value
        parentController.scene.currentEmitter.particleSpeed = value
    }
    
    // Speed Range
    @IBAction func actSpeedRange(_ sender: Any) {
        let value = CGFloat(sldSpeedRange.value)
        customEmitter.config["SPEED_RANGE"] = value
        parentController.scene.currentEmitter.particleSpeedRange = value
    }
    
    // Acceleration Start
    @IBAction func actAccelerationX(_ sender: Any) {
        let value = CGFloat(sldAccelerationX.value)
        customEmitter.config["ACCELERATION_X"] = value
        parentController.scene.currentEmitter.xAcceleration = value
    }
    
    // Acceleration Range
    @IBAction func actAccelerationY(_ sender: Any) {
        let value = CGFloat(sldAccelerationY.value)
        customEmitter.config["ACCELERATION_Y"] = value
        parentController.scene.currentEmitter.yAcceleration = value
    }
    
    // Alpha Start
    @IBAction func actAlphaStart(_ sender: Any) {
        let value = CGFloat(sldAlphaStart.value)
        customEmitter.config["ALPHA_START"] = value
        parentController.scene.currentEmitter.particleAlpha = value
    }
    
    // Alpha Range
    @IBAction func actAlphaRange(_ sender: Any) {
        let value = CGFloat(sldAlphaRange.value)
        customEmitter.config["ALPHA_RANGE"] = value
        parentController.scene.currentEmitter.particleAlphaRange = value
    }
    
    // Alpha Speed
    @IBAction func actAlphaSpeed(_ sender: Any) {
        let value = CGFloat(sldAlphaSpeed.value)
        customEmitter.config["ALPHA_SPEED"] = value
        parentController.scene.currentEmitter.particleAlphaSpeed = value
    }
    
    // Scale Start
    @IBAction func actScaleStart(_ sender: Any) {
        let value = CGFloat(sldScaleStart.value)
        customEmitter.config["SCALE_START"] = value
        parentController.scene.currentEmitter.particleScale = value
    }
    
    // Scale Range
    @IBAction func actScaleRange(_ sender: Any) {
        let value = CGFloat(sldScaleRange.value)
        customEmitter.config["SCALE_RANGE"] = value
        parentController.scene.currentEmitter.particleScaleRange = value
    }
    
    // Scale Speed
    @IBAction func actScaleSpeed(_ sender: Any) {
        let value = CGFloat(sldScaleSpeed.value)
        customEmitter.config["SCALE_SPEED"] = value
        parentController.scene.currentEmitter.particleScaleSpeed = value
    }
    
    // Rotation Start
    @IBAction func actRotationStart(_ sender: Any) {
        let value = CGFloat(sldRotationStart.value)
        customEmitter.config["ROTATION_START"] = value
        parentController.scene.currentEmitter.particleRotation = value
    }
    
    // Rotation Range
    @IBAction func actRotationRange(_ sender: Any) {
        let value = CGFloat(sldRotationRange.value)
        customEmitter.config["ROTATION_RANGE"] = value
        parentController.scene.currentEmitter.particleRotationRange = value
    }
    
    // Rotation Speed
    @IBAction func actRotationSpeed(_ sender: Any) {
        let value = CGFloat(sldRotationSpeed.value)
        customEmitter.config["ROTATION_SPEED"] = value
        parentController.scene.currentEmitter.particleRotationSpeed = value
    }
    
    
}
