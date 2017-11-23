//
//  catalogueEmitter.swift
//  emitterSandbox
//
//  Created by Joris ZEFIRINI on 17/11/2017.
//  Copyright © 2017 SoniWeb. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

class catalogueEmitter {
    
    // Nos différents types d'Emitter
    enum type : String{
        case Spark = "Spark"
        case Fire = "Fire"
    }
    
    // Un dictionnaire contenant différents Emitter pré-enregistré
    // En fonction des types d'Emitter declaré ci-dessus
    static let catalogue : [type : [String : Any] ] = [
        type.Spark : [
            "NAME" : "Spark",
            "TEXTURE" : SKTexture.init(imageNamed: "spark.png"),
            "COLOR_DEB" : UIColor.init(red: 255/255, green: 179/255, blue: 60/255, alpha: 1),
            "EMITTER_BIRTHRATE" : CGFloat(2000),
            "EMITTER_MAXIMUM" : Int(0),
            "LIFETIME_START" : CGFloat(1),
            "LIFETIME_RANGE" : CGFloat(0),
            "POSITION_RANGE_X" : CGFloat(50),
            "POSITION_RANGE_Y" : CGFloat(0),
            "POSITION_RANGE_Z" : CGFloat(1),
            "ANGLE_START" : CGFloat( (89.954 * Double.pi) / 180),
            "ANGLE_RANGE" : CGFloat( (360.39 * Double.pi) / 180),
            "SPEED_START" : CGFloat(500),
            "SPEED_RANGE" : CGFloat(500),
            "ACCELERATION_X" : CGFloat(0),
            "ACCELERATION_Y" : CGFloat(-1000),
            "ALPHA_START" : CGFloat(1),
            "ALPHA_RANGE" : CGFloat(0.2),
            "ALPHA_SPEED" : CGFloat(-1),
            "SCALE_START" : CGFloat(0.3),
            "SCALE_RANGE" : CGFloat(0.2),
            "SCALE_SPEED" : CGFloat(-0.4),
            "ROTATION_START" : CGFloat( (0 * Double.pi) / 180),
            "ROTATION_RANGE" : CGFloat( (359.818 * Double.pi) / 180),
            "ROTATION_SPEED" : CGFloat( (0 * Double.pi) / 180),
            "COLOR_BLEND_FACTOR" : CGFloat(1),
            "COLOR_BLEND_MODE" : SKBlendMode.add
        ],
        type.Fire : [
            "NAME" : "Fire",
            "TEXTURE" : SKTexture.init(imageNamed: "spark.png"),
            "COLOR_DEB" : UIColor.init(red: 78/255, green: 33/255, blue: 6/255, alpha: 1),
            "EMITTER_BIRTHRATE" : CGFloat(455.28),
            "EMITTER_MAXIMUM" : Int(0),
            "LIFETIME_START" : CGFloat(2.5),
            "LIFETIME_RANGE" : CGFloat(0),
            "POSITION_RANGE_X" : CGFloat(55.65),
            "POSITION_RANGE_Y" : CGFloat(5),
            "POSITION_RANGE_Z" : CGFloat(1),
            "ANGLE_START" : CGFloat( (89.381 * Double.pi) / 180),
            "ANGLE_RANGE" : CGFloat( (20.054 * Double.pi) / 180),
            "SPEED_START" : CGFloat(100),
            "SPEED_RANGE" : CGFloat(50),
            "ACCELERATION_X" : CGFloat(0),
            "ACCELERATION_Y" : CGFloat(-0),
            "ALPHA_START" : CGFloat(0.8),
            "ALPHA_RANGE" : CGFloat(0.2),
            "ALPHA_SPEED" : CGFloat(-0.45),
            "SCALE_START" : CGFloat(0.5),
            "SCALE_RANGE" : CGFloat(0.4),
            "SCALE_SPEED" : CGFloat(-0.5),
            "ROTATION_START" : CGFloat( (0 * Double.pi) / 180),
            "ROTATION_RANGE" : CGFloat( (0 * Double.pi) / 180),
            "ROTATION_SPEED" : CGFloat( (0 * Double.pi) / 180),
            "COLOR_BLEND_FACTOR" : CGFloat(1),
            "COLOR_BLEND_MODE" : SKBlendMode.add
        ]
    ]
    
    // Fonction qui nous retourne un tableau de configuration
    // en fonction du type donnée en parametre
    static func getEmitterFromCatalogue(_ typeEmitter:type) -> [String : Any]{
        return catalogue[typeEmitter]!
    }
}
