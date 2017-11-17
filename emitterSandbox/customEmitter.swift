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
    
    //On déclare et initialise toutes nos variables statics
    //C-a-d tous les paremetres possibles de notre emitters
    static var COLOR_DEB = UIColor.yellow
    static var EMITTER_BIRTHRATE = 100
    static var EMITTER_MAXIMUM = 0
    static var LIFETIME_START = 1
    static var LIFETIME_RANGE = 0
    static var POSITION_RANGE_X = 0
    static var POSITION_RANGE_Y = 0
    static var POSITION_RANGE_Z = 0
    static var ANGLE_START = 0
    static var ANGLE_RANGE = 0
    static var SPEED_START = 0
    static var SPEED_RANGE = 0
    static var ACCELERATION_X = 0
    static var ACCELERATION_Y = 0
    static var ALPHA_START = 0
    static var ALPHA_RANGE = 0
    static var ALPHA_SPEED = 0
    static var SCALE_START = 0
    static var SCALE_RANGE = 0
    static var SCALE_SPEED = 0
    static var ROTATION_START = 0
    static var ROTATION_RANGE = 0
    static var ROTATION_SPEED = 0
    
    override init() {
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
