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
    
    // Déclarations de nos variables
    var currentEmitter : customEmitter!
    
    // Lorsqu'on touche l'écran
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // On s'assure que le menu soit fermé
        if(!EmitterViewController.menuIsOpen){
            removeEmitterFromParent()
            
            let t = touches.first!
            self.addChild(createEmitter())
            currentEmitter.position = t.location(in: self)
        }
    }
    
    // Lorsque notre doigt bouge dans l'écran
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // On s'assure que le menu soit fermé
        if(!EmitterViewController.menuIsOpen){
            let t = touches.first!
            if(self.children.contains(currentEmitter)){
                currentEmitter.position = t.location(in: self)
            }
        }
    }
    
    // Lorsqu'on retire notre doigt de l'écran
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // On s'assure que le menu soit fermé
        if(!EmitterViewController.menuIsOpen){
            disabledEmitter()
        }
    }
    
    // Créer un customEmitter et le retourne
    func createEmitter() -> SKEmitterNode {
        currentEmitter = customEmitter()
        currentEmitter.targetNode = self
        return currentEmitter
    }
    
    // Desactive l'emitter courant en mettant son nombre de particule à 1
    func disabledEmitter(){
        if(self.children.contains(currentEmitter)){
            currentEmitter.numParticlesToEmit = 1
        }
    }
    
    // Supprime l'emitter courant de la scene
    func removeEmitterFromParent(){
        if(currentEmitter != nil){
            currentEmitter.removeFromParent()
        }
    }
}
