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
    @IBOutlet weak var sldEmitterBirthrate: customSlider!
    @IBOutlet weak var sldPositionRangeX: customSlider!
    @IBOutlet weak var sldPositionRangeY: customSlider!
    @IBOutlet weak var sldAngleStart: customSlider!
    @IBOutlet weak var sldAngleRange: customSlider!
    @IBOutlet weak var sldSpeedStart: customSlider!
    @IBOutlet weak var sldSpeedRange: customSlider!
    @IBOutlet weak var sldAccelerationX: customSlider!
    @IBOutlet weak var sldAccelerationY: customSlider!
    
    
    // Déclarations de nos variables
    var parentController : EmitterViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.clear
        
        //On configure si notre slider retourne un angle ou non
        sldAngleStart.isAngle = true
        sldAngleRange.isAngle = true
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
    
    
}
