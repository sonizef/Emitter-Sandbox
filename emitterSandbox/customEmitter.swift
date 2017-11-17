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
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
