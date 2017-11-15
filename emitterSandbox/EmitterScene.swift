//
//  GameScene.swift
//  emitterSandbox
//
//  Created by Joris ZEFIRINI on 13/11/2017.
//  Copyright © 2017 SoniWeb. All rights reserved.
//

import SpriteKit
import GameplayKit

class EmitterScene: SKScene {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()

    var currentEmitter : SKEmitterNode!
    var currentType : listEmitter = listEmitter.Spark
    
    enum listEmitter {
        case Spark
        case Fire
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if(currentEmitter != nil){
            currentEmitter.removeFromParent()
        }
        
        for t in touches{
            self.addChild(createEmitter(currentType))
            currentEmitter.position = t.location(in: self)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches{
            if(self.children.contains(currentEmitter)){
                currentEmitter.position = t.location(in: self)
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(self.children.contains(currentEmitter)){
            currentEmitter.numParticlesToEmit = 1
        }
    }
    
    func createEmitter(_ nameEmitter : listEmitter) -> SKEmitterNode {
        let fileName : String!

        switch nameEmitter {
            case .Spark:
                fileName = "particleSpark.sks"
                break
            case .Fire:
                fileName = "particleFire.sks"
                break
        }
        
        currentEmitter = SKEmitterNode(fileNamed: fileName)!
        currentEmitter.targetNode = self
        return currentEmitter
    }
}
