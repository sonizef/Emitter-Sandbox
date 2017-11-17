//
//  GameViewController.swift
//  emitterSandbox
//
//  Created by Joris ZEFIRINI on 13/11/2017.
//  Copyright © 2017 SoniWeb. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class EmitterViewController: UIViewController{
    
    // Déclaration de nos outlets
    @IBOutlet weak var menu: UIView!
    
    // Déclaration de nos variables statics
    static var menuIsOpen : Bool = false
    
    // Déclaration de nos constantes
    let list = ["Spark", "Fire"]
    
    // Déclaration de nos variables
    var scene : EmitterScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // On place notre menu fermé de manière responsive sur l'écran
        menu.frame = CGRect(x: self.view.frame.width, y: (self.navigationController?.navigationBar.bounds.height)!, width: self.view.frame.width*0.5, height: self.view.frame.height - (self.navigationController?.navigationBar.bounds.height)!)
        
        
        // Chargement 'GameScene.sks' en tant que GKScene. Cela permet de recuperer les élèments de notre scène
        if let scene = GKScene(fileNamed: "EmitterScene") {
            
            // On créer la scène chargée
            if let sceneNode = scene.rootNode as! EmitterScene? {
                
                // On l'associe à notre variable
                self.scene = sceneNode
                
                // Mode d'affichage de la scène
                sceneNode.scaleMode = .aspectFill
                
                // Affichage de la scène
                if let view = self.view as! SKView? {
                    view.presentScene(sceneNode)
                    
                    view.ignoresSiblingOrder = true
                    
                    view.showsFPS = true
                    view.showsNodeCount = true
                }
            }
        }
    }

    // Autoriser la rotation de l'écran
    override var shouldAutorotate: Bool {
        return true
    }

    // Si l'écran est retourné on n'autorise pas la rotation de celui-ci
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    // On masque la statusbar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // On ouvre ou ferme le menu en fonction si celui-ci l'est deja ou non
    @IBAction func actMenu(_ sender: Any) {
        if(EmitterViewController.menuIsOpen){
            closeMenu()
        }
        else{
            openMenu()
        }
    }
    
    // Fonction qui ouvre le menu
    func openMenu(){
        // Si un emitter courant existe déjà on le supprime
        scene.removeEmitterFromParent()
        
        // Animation d'ouverture du menu
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
            self.menu.transform = CGAffineTransform(translationX: -self.menu.frame.width, y: 0)
            self.scene.addChild(self.scene.createEmitter())
            EmitterViewController.menuIsOpen = true
        })
    }
    
    // Fonction qui ferme le menu
    func closeMenu(){
        // Animation de fermeture du menu
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseIn, animations: {
            self.menu.transform = CGAffineTransform(translationX: self.menu.frame.width, y: 0)
            self.scene.disabledEmitter()
            EmitterViewController.menuIsOpen = false
        })
    }
    
}
