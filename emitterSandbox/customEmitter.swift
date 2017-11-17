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
    
    //On déclare et initialise toutes nos variables statics dans un dictionnaire
    //C-a-d tous les paremetres possibles de notre emitters
    static var config : [String : Any] = [
        "COLOR_DEB" : UIColor.yellow,
        "EMITTER_BIRTHRATE" : 100,
        "EMITTER_MAXIMUM" : 0,
        "LIFETIME_START" : 1,
        "LIFETIME_RANGE" : 0,
        "POSITION_RANGE_X" : 0,
        "POSITION_RANGE_Y" : 0,
        "POSITION_RANGE_Z" : 0,
        "ANGLE_START" : 0,
        "ANGLE_RANGE" : 0,
        "SPEED_START" : 0,
        "SPEED_RANGE" : 0,
        "ACCELERATION_X" : 0,
        "ACCELERATION_Y" : 0,
        "ALPHA_START" : 0,
        "ALPHA_RANGE" : 0,
        "ALPHA_SPEED" : 0,
        "SCALE_START" : 0,
        "SCALE_RANGE" : 0,
        "SCALE_SPEED" : 0,
        "ROTATION_START" : 0,
        "ROTATION_RANGE" : 0,
        "ROTATION_SPEED" : 0
    ]
    
    override init() {
        super.init()
        configureFromDictionnary()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureFromDictionnary(){
        
        //On configure notre particule en fonction des données entrées dans le dictionnaire
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
        self.particleAlpha = customEmitter.config["ALPHA_START"] as! CGFloat
        self.particleAlphaRange = customEmitter.config["ALPHA_RANGE"] as! CGFloat
        self.particleAlphaSpeed = customEmitter.config["ALPHA_SPEED"] as! CGFloat
        self.particleScale = customEmitter.config["SCALE_START"] as! CGFloat
        self.particleScaleRange = customEmitter.config["SCALE_RANGE"] as! CGFloat
        self.particleScaleSpeed = customEmitter.config["SCALE_SPEED"] as! CGFloat
        self.particleRotation = customEmitter.config["ROTATION_START"] as! CGFloat
        self.particleRotationRange = customEmitter.config["ROTATION_RANGE"] as! CGFloat
        self.particleRotationSpeed = customEmitter.config["ROTATION_SPEED"] as! CGFloat
        
    }
    
}
