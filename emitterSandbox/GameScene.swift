//
//  GameScene.swift
//  emitterSandbox
//
//  Created by Joris ZEFIRINI on 13/11/2017.
//  Copyright © 2017 SoniWeb. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()

    var currentEmitter : SKEmitterNode!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if(currentEmitter != nil){
            currentEmitter.removeFromParent()
        }
        
        for t in touches{
            self.addChild(createEmitter())
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
            currentEmitter.numParticlesToEmit = 100
        }
    }
    
    func createEmitter() -> SKEmitterNode {
        currentEmitter = SKEmitterNode(fileNamed: "myParticle.sks")!
        currentEmitter.targetNode = self
        return currentEmitter
    }
}
