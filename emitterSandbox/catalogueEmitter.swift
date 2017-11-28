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
        case Spark
        case Fire
        case Bokeh
        case FireFlies
        case Magic
        case Rain
        case Smoke
        case Snow
    }
    
    // Un dictionnaire contenant différents Emitter pré-enregistré
    // En fonction des types d'Emitter declaré ci-dessus
    static var catalogue : [type : [String : Any] ] = [
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
            "ROTATION_START" : CGFloat(0),
            "ROTATION_RANGE" : CGFloat( (359.818 * Double.pi) / 180),
            "ROTATION_SPEED" : CGFloat(0),
            "COLOR_BLEND_FACTOR" : CGFloat(1),
            "BLEND_MODE" : SKBlendMode.add
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
            "ROTATION_START" : CGFloat(0),
            "ROTATION_RANGE" : CGFloat(0),
            "ROTATION_SPEED" : CGFloat(0),
            "COLOR_BLEND_FACTOR" : CGFloat(1),
            "BLEND_MODE" : SKBlendMode.add
        ],
        type.Bokeh : [
            "NAME" : "Bokeh",
            "TEXTURE" : SKTexture.init(imageNamed: "bokeh.png"),
            "COLOR_DEB" : UIColor.init(red: 219/255, green: 202/255, blue: 66/255, alpha: 1),
            "EMITTER_BIRTHRATE" : CGFloat(130),
            "EMITTER_MAXIMUM" : Int(0),
            "LIFETIME_START" : CGFloat(10),
            "LIFETIME_RANGE" : CGFloat(0),
            "POSITION_RANGE_X" : CGFloat(360),
            "POSITION_RANGE_Y" : CGFloat(650),
            "POSITION_RANGE_Z" : CGFloat(1),
            "ANGLE_START" : CGFloat( (89.381 * Double.pi) / 180),
            "ANGLE_RANGE" : CGFloat( (360 * Double.pi) / 180),
            "SPEED_START" : CGFloat(0),
            "SPEED_RANGE" : CGFloat(10),
            "ACCELERATION_X" : CGFloat(0),
            "ACCELERATION_Y" : CGFloat(-0),
            "ALPHA_START" : CGFloat(0.6),
            "ALPHA_RANGE" : CGFloat(0),
            "ALPHA_SPEED" : CGFloat(-0.06),
            "SCALE_START" : CGFloat(0),
            "SCALE_RANGE" : CGFloat(0),
            "SCALE_SPEED" : CGFloat(0.15),
            "ROTATION_START" : CGFloat(0),
            "ROTATION_RANGE" : CGFloat( (360 * Double.pi) / 180),
            "ROTATION_SPEED" : CGFloat( (1.146 * Double.pi) / 180),
            "COLOR_BLEND_FACTOR" : CGFloat(1),
            "BLEND_MODE" : SKBlendMode.screen
        ],
        type.FireFlies : [
            "NAME" : "Fire Flies",
            "TEXTURE" : SKTexture.init(imageNamed: "spark.png"),
            "COLOR_DEB" : UIColor.init(red: 244/255, green: 251/255, blue: 55/255, alpha: 1),
            "EMITTER_BIRTHRATE" : CGFloat(250),
            "EMITTER_MAXIMUM" : Int(0),
            "LIFETIME_START" : CGFloat(2.5),
            "LIFETIME_RANGE" : CGFloat(0),
            "POSITION_RANGE_X" : CGFloat(350),
            "POSITION_RANGE_Y" : CGFloat(650),
            "POSITION_RANGE_Z" : CGFloat(1),
            "ANGLE_START" : CGFloat( (89.381 * Double.pi) / 180),
            "ANGLE_RANGE" : CGFloat( (360 * Double.pi) / 180),
            "SPEED_START" : CGFloat(0),
            "SPEED_RANGE" : CGFloat(100),
            "ACCELERATION_X" : CGFloat(0),
            "ACCELERATION_Y" : CGFloat(-0),
            "ALPHA_START" : CGFloat(0.8),
            "ALPHA_RANGE" : CGFloat(0.2),
            "ALPHA_SPEED" : CGFloat(-0.35),
            "SCALE_START" : CGFloat(0.2),
            "SCALE_RANGE" : CGFloat(0),
            "SCALE_SPEED" : CGFloat(0.45),
            "ROTATION_START" : CGFloat(0),
            "ROTATION_RANGE" : CGFloat(0),
            "ROTATION_SPEED" : CGFloat(0),
            "COLOR_BLEND_FACTOR" : CGFloat(1),
            "BLEND_MODE" : SKBlendMode.alpha
        ],
        type.Magic : [
            "NAME" : "Magic",
            "TEXTURE" : SKTexture.init(imageNamed: "spark.png"),
            "COLOR_DEB" : UIColor.init(red: 89/255, green: 255/255, blue: 75/255, alpha: 1),
            "EMITTER_BIRTHRATE" : CGFloat(250),
            "EMITTER_MAXIMUM" : Int(0),
            "LIFETIME_START" : CGFloat(2.5),
            "LIFETIME_RANGE" : CGFloat(0),
            "POSITION_RANGE_X" : CGFloat(350),
            "POSITION_RANGE_Y" : CGFloat(650),
            "POSITION_RANGE_Z" : CGFloat(1),
            "ANGLE_START" : CGFloat( (89.381 * Double.pi) / 180),
            "ANGLE_RANGE" : CGFloat( (360 * Double.pi) / 180),
            "SPEED_START" : CGFloat(0),
            "SPEED_RANGE" : CGFloat(100),
            "ACCELERATION_X" : CGFloat(0),
            "ACCELERATION_Y" : CGFloat(-0),
            "ALPHA_START" : CGFloat(0.8),
            "ALPHA_RANGE" : CGFloat(0.2),
            "ALPHA_SPEED" : CGFloat(-0.35),
            "SCALE_START" : CGFloat(0.2),
            "SCALE_RANGE" : CGFloat(0),
            "SCALE_SPEED" : CGFloat(0.45),
            "ROTATION_START" : CGFloat(0),
            "ROTATION_RANGE" : CGFloat(0),
            "ROTATION_SPEED" : CGFloat(0),
            "COLOR_BLEND_FACTOR" : CGFloat(1),
            "BLEND_MODE" : SKBlendMode.alpha
        ],
        type.Rain : [
            "NAME" : "Rain",
            "TEXTURE" : SKTexture.init(imageNamed: "spark.png"),
            "COLOR_DEB" : UIColor.init(red: 139/255, green: 145/255, blue: 255/255, alpha: 1),
            "EMITTER_BIRTHRATE" : CGFloat(150),
            "EMITTER_MAXIMUM" : Int(0),
            "LIFETIME_START" : CGFloat(8),
            "LIFETIME_RANGE" : CGFloat(0),
            "POSITION_RANGE_X" : CGFloat(242.3),
            "POSITION_RANGE_Y" : CGFloat(5),
            "POSITION_RANGE_Z" : CGFloat(1),
            "ANGLE_START" : CGFloat( (254.393 * Double.pi) / 180),
            "ANGLE_RANGE" : CGFloat( (1.719 * Double.pi) / 180),
            "SPEED_START" : CGFloat(340),
            "SPEED_RANGE" : CGFloat(150),
            "ACCELERATION_X" : CGFloat(0),
            "ACCELERATION_Y" : CGFloat(-150),
            "ALPHA_START" : CGFloat(1),
            "ALPHA_RANGE" : CGFloat(0.2),
            "ALPHA_SPEED" : CGFloat(0),
            "SCALE_START" : CGFloat(0.1),
            "SCALE_RANGE" : CGFloat(0.05),
            "SCALE_SPEED" : CGFloat(0),
            "ROTATION_START" : CGFloat(0),
            "ROTATION_RANGE" : CGFloat(0),
            "ROTATION_SPEED" : CGFloat(0),
            "COLOR_BLEND_FACTOR" : CGFloat(1),
            "BLEND_MODE" : SKBlendMode.alpha
        ],
        type.Smoke : [
            "NAME" : "Smoke",
            "TEXTURE" : SKTexture.init(imageNamed: "spark.png"),
            "COLOR_DEB" : UIColor.init(red: 247/255, green: 247/255, blue: 255/255, alpha: 1),
            "EMITTER_BIRTHRATE" : CGFloat(40),
            "EMITTER_MAXIMUM" : Int(0),
            "LIFETIME_START" : CGFloat(10),
            "LIFETIME_RANGE" : CGFloat(0),
            "POSITION_RANGE_X" : CGFloat(40),
            "POSITION_RANGE_Y" : CGFloat(5),
            "POSITION_RANGE_Z" : CGFloat(1),
            "ANGLE_START" : CGFloat( (89.381 * Double.pi) / 180),
            "ANGLE_RANGE" : CGFloat( (20.054 * Double.pi) / 180),
            "SPEED_START" : CGFloat(40),
            "SPEED_RANGE" : CGFloat(40),
            "ACCELERATION_X" : CGFloat(0),
            "ACCELERATION_Y" : CGFloat(10),
            "ALPHA_START" : CGFloat(0.4),
            "ALPHA_RANGE" : CGFloat(0.3),
            "ALPHA_SPEED" : CGFloat(-0.15),
            "SCALE_START" : CGFloat(0.5),
            "SCALE_RANGE" : CGFloat(0.3),
            "SCALE_SPEED" : CGFloat(0.5),
            "ROTATION_START" : CGFloat(0),
            "ROTATION_RANGE" : CGFloat( (359.818 * Double.pi) / 180),
            "ROTATION_SPEED" : CGFloat( (171.887 * Double.pi) / 180),
            "COLOR_BLEND_FACTOR" : CGFloat(1),
            "BLEND_MODE" : SKBlendMode.alpha
        ],
        type.Snow : [
            "NAME" : "Snow",
            "TEXTURE" : SKTexture.init(imageNamed: "spark.png"),
            "COLOR_DEB" : UIColor.init(red: 247/255, green: 247/255, blue: 255/255, alpha: 1),
            "EMITTER_BIRTHRATE" : CGFloat(40),
            "EMITTER_MAXIMUM" : Int(0),
            "LIFETIME_START" : CGFloat(8),
            "LIFETIME_RANGE" : CGFloat(0),
            "POSITION_RANGE_X" : CGFloat(363.44),
            "POSITION_RANGE_Y" : CGFloat(5),
            "POSITION_RANGE_Z" : CGFloat(1),
            "ANGLE_START" : CGFloat( (269.863 * Double.pi) / 180),
            "ANGLE_RANGE" : CGFloat( (22.918 * Double.pi) / 180),
            "SPEED_START" : CGFloat(80),
            "SPEED_RANGE" : CGFloat(100),
            "ACCELERATION_X" : CGFloat(0),
            "ACCELERATION_Y" : CGFloat(-10),
            "ALPHA_START" : CGFloat(1),
            "ALPHA_RANGE" : CGFloat(0.2),
            "ALPHA_SPEED" : CGFloat(0),
            "SCALE_START" : CGFloat(0.2),
            "SCALE_RANGE" : CGFloat(0.2),
            "SCALE_SPEED" : CGFloat(0),
            "ROTATION_START" : CGFloat(0),
            "ROTATION_RANGE" : CGFloat(0),
            "ROTATION_SPEED" : CGFloat(0),
            "COLOR_BLEND_FACTOR" : CGFloat(1),
            "BLEND_MODE" : SKBlendMode.alpha
        ]
    ]
    
    // Fonction qui nous retourne un tableau de configuration
    // en fonction du type donnée en parametre
    static func getEmitterFromCatalogue(_ typeEmitter:type) -> [String : Any]{
        return catalogue[typeEmitter]!
    }
}
