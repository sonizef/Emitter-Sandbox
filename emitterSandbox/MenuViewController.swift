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
    
    // Actions de nos sliders
    // Birthrate
    @IBAction func actEmitterBirthrate(_ sender: Any) {
        let value = CGFloat(sldEmitterBirthrate.value)
        customEmitter.config["EMITTER_BIRTHRATE"] = value
        parentController.scene.currentEmitter.particleBirthRate = value
    }
    
    
}
