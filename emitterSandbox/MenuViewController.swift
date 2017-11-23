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
    @IBOutlet weak var sldEmitterBirthrate: UISlider!
    @IBOutlet weak var sldPositionRangeX: UISlider!
    @IBOutlet weak var sldPositionRangeY: UISlider!
    
    
    // Déclarations de nos variables
    var parentController : EmitterViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.clear
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
    
    
    
}
