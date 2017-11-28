//
//  customEmitter.swift
//  emitterSandbox
//
//  Created by Joris ZEFIRINI on 14/11/2017.
//  Copyright © 2017 SoniWeb. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class customEmitter : SKEmitterNode{
    
    // Variable qui contient un dictionnaire avec tous les parametres
    // modifiable de notre customEmitter (par defaut parametre de "Spark")
    static var config : [String : Any] = catalogueEmitter.getEmitterFromCatalogue(.Spark)
    
    // Lorsqu'on créer un customEmitter
    override init() {
        super.init()
        
        // À chaque création d'emitter on recupere nos variables contenu dans
        // notre dictionnaire "config"
        configureFromDictionary()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // On configure notre emitter en fonction des données contenu dans le dictionnaire
    private func configureFromDictionary(){
        self.particleTexture = (customEmitter.config["TEXTURE"] as! SKTexture)
        self.particleColor = customEmitter.config["COLOR_DEB"] as! UIColor
        self.particleBirthRate = customEmitter.config["EMITTER_BIRTHRATE"] as! CGFloat
        self.numParticlesToEmit = customEmitter.config["EMITTER_MAXIMUM"] as! Int
        self.particleLifetime = customEmitter.config["LIFETIME_START"] as! CGFloat
        self.particleLifetimeRange = customEmitter.config["LIFETIME_RANGE"] as! CGFloat
        self.particlePositionRange.dx = customEmitter.config["POSITION_RANGE_X"] as! CGFloat
        self.particlePositionRange.dy = customEmitter.config["POSITION_RANGE_Y"] as! CGFloat
        self.zPosition = customEmitter.config["POSITION_RANGE_Z"] as! CGFloat
        self.emissionAngle = customEmitter.config["ANGLE_START"] as! CGFloat
        self.emissionAngleRange = customEmitter.config["ANGLE_RANGE"] as! CGFloat
        self.particleSpeed = customEmitter.config["SPEED_START"] as! CGFloat
        self.particleSpeedRange = customEmitter.config["SPEED_RANGE"] as! CGFloat
        self.xAcceleration = customEmitter.config["ACCELERATION_X"] as! CGFloat
        self.yAcceleration = customEmitter.config["ACCELERATION_Y"] as! CGFloat
        self.particleAlpha = customEmitter.config["ALPHA_START"] as! CGFloat
        self.particleAlphaRange = customEmitter.config["ALPHA_RANGE"] as! CGFloat
        self.particleAlphaSpeed = customEmitter.config["ALPHA_SPEED"] as! CGFloat
        self.particleScale = customEmitter.config["SCALE_START"] as! CGFloat
        self.particleScaleRange = customEmitter.config["SCALE_RANGE"] as! CGFloat
        self.particleScaleSpeed = customEmitter.config["SCALE_SPEED"] as! CGFloat
        self.particleRotation = customEmitter.config["ROTATION_START"] as! CGFloat
        self.particleRotationRange = customEmitter.config["ROTATION_RANGE"] as! CGFloat
        self.particleRotationSpeed = customEmitter.config["ROTATION_SPEED"] as! CGFloat
        self.particleColorBlendFactor = customEmitter.config["COLOR_BLEND_FACTOR"] as! CGFloat
        self.particleBlendMode = customEmitter.config["BLEND_MODE"] as! SKBlendMode
    }
    
    // On change notre dictionnaire en fonction d'un type déjà stocké dans le catalogue
    static func setDictionaryFromCatalogue(_ typeEmitter : catalogueEmitter.type){
        customEmitter.config = catalogueEmitter.getEmitterFromCatalogue(typeEmitter)
    }
    
}
