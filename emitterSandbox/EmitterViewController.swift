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
    
    var scene : EmitterScene!
    var dataPicker = UIPickerView()
    @IBOutlet weak var menu: UIView!
    
    var menuIsOpen : Bool = false
    
    let list = ["Spark", "Fire"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //On place notre menu
        menu.frame = CGRect(x: self.view.frame.width, y: (self.navigationController?.navigationBar.bounds.height)!, width: self.view.frame.width*0.5, height: self.view.frame.height - (self.navigationController?.navigationBar.bounds.height)!)
        
        
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
        if let scene = GKScene(fileNamed: "EmitterScene") {
            
            // Get the SKScene from the loaded GKScene
            if let sceneNode = scene.rootNode as! EmitterScene? {
                
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
        //On ferme le menu si il est ouvert
        if(menuIsOpen){
            closeMenu()
        }
        
        
        //Création de notre alert
        let alertSelection = UIAlertController(title: "Selectionner un style\n\n\n\n\n\n\n", message: "", preferredStyle: .actionSheet)

        //On ajoute un bouton ok
        alertSelection.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (btn) in
            
            switch self.list[self.dataPicker.selectedRow(inComponent: 0)]{
            case "Spark":
                self.scene.currentType = EmitterScene.listEmitter.Spark
                break
            case "Fire":
                self.scene.currentType = EmitterScene.listEmitter.Fire
                break
            default:
                self.scene.currentType = EmitterScene.listEmitter.Spark
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
    
    //On ouvre ou ferme le menu en fonction si celui-ci l'est deja ou non
    @IBAction func actMenu(_ sender: Any) {
        if(menuIsOpen){
            closeMenu()
        }
        else{
            openMenu()
        }
    }
    
    func openMenu(){
        let animOpen = CGAffineTransform(translationX: -menu.frame.width, y: 0)
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
            self.menu.transform = animOpen
            self.scene.addChild(self.scene.createEmitter())
        }) { (bool) in
            self.menuIsOpen = true
        }
    }
    
    func closeMenu(){
        let animClose = CGAffineTransform(translationX: menu.frame.width, y: 0)
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseIn, animations: {
            self.menu.transform = animClose
            self.scene.removeEmitter()
        }) { (bool) in
            self.menuIsOpen = false
        }
    }
    
}
