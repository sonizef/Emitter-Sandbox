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

class GameViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var scene : GameScene!
    var dataPicker = UIPickerView()
    
    let list = ["Spark", "Fire"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
        if let scene = GKScene(fileNamed: "GameScene") {
            
            // Get the SKScene from the loaded GKScene
            if let sceneNode = scene.rootNode as! GameScene? {
                
                self.scene = sceneNode
                
                // Copy gameplay related content over to the scene
                sceneNode.entities = scene.entities
                sceneNode.graphs = scene.graphs
                
                // Set the scale mode to scale to fit the window
                sceneNode.scaleMode = .aspectFill
                
                // Present the scene
                if let view = self.view as! SKView? {
                    view.presentScene(sceneNode)
                    
                    view.ignoresSiblingOrder = true
                    
                    view.showsFPS = true
                    view.showsNodeCount = true
                }
            }
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

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

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }

    @IBAction func actListEmitter(_ sender: Any) {
        //Création de notre alert
        let alertSelection = UIAlertController(title: "Selectionner un style\n\n\n\n\n\n\n", message: "", preferredStyle: .actionSheet)

        //On ajoute un bouton ok
        alertSelection.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (btn) in
            
            switch self.list[self.dataPicker.selectedRow(inComponent: 0)]{
            case "Spark":
                self.scene.currentType = GameScene.listEmitter.Spark
                break
            case "Fire":
                self.scene.currentType = GameScene.listEmitter.Fire
                break
            default:
                self.scene.currentType = GameScene.listEmitter.Spark
            }
        }))
        
        //On ajoute notre data picker
        dataPicker = UIPickerView(frame: CGRect(x: 0, y: 40, width:350, height: 140))
        
        dataPicker.delegate = self
        dataPicker.dataSource = self
        
        alertSelection.view.addSubview(dataPicker)
        
        //On affiche notre alert
        self.present(alertSelection, animated: true, completion: nil)
        dataPicker.reloadAllComponents()
        
    }
    
}
