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
        
        if(!EmitterViewController.menuIsOpen){
            if(currentEmitter != nil){
                currentEmitter.removeFromParent()
            }
            
            let t = touches.first!
            self.addChild(createEmitter())
            currentEmitter.position = t.location(in: self)
        }
    
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if(!EmitterViewController.menuIsOpen){
            let t = touches.first!
            if(self.children.contains(currentEmitter)){
                currentEmitter.position = t.location(in: self)
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if(!EmitterViewController.menuIsOpen){
            removeEmitter()
        }
    }
    
    //Créer un custom emitter et le retourne
    func createEmitter() -> SKEmitterNode {
        currentEmitter = customEmitter()
        currentEmitter.targetNode = self
        return currentEmitter
    }
    
    //Si la scene contient un emitter, alors on la supprime
    func removeEmitter(){
        if(self.children.contains(currentEmitter)){
            currentEmitter.numParticlesToEmit = 1
        }
    }
}
