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

class EmitterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    // Déclaration de nos outlets
    @IBOutlet weak var menu: UIView!
    
    // Déclaration de nos variables statics
    static var menuIsOpen : Bool = false
    
    // Déclaration de nos constantes
    
    // Déclaration de nos variables
    var menuController : MenuViewController!
    var scene : EmitterScene!
    var alertLibrary : UIAlertController!
    var pickerEmitterType : UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // On place notre menu fermé de manière responsive sur l'écran
        menu.frame = CGRect(x: self.view.frame.width, y: (self.navigationController?.navigationBar.bounds.height)!, width: self.view.frame.width*0.5, height: self.view.frame.height - (self.navigationController?.navigationBar.bounds.height)!)
        
        initAlert()
        
        
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
    
    // Nombre de compenant dans notre picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Nombre de ligne par compenant dans notre picker
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return catalogueEmitter.catalogue.count
    }
    
    // Affichage des lignes de notre picker
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return (Array(catalogueEmitter.catalogue)[row].value["NAME"] as! String)
    }
    
    // Liaison qui permet de passer notre currentEmitter vers notre menu
    // Afin de pouvoir modifier celui-ci, chaque parametre à la fois
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "segueMenu"){
            let vc = segue.destination as! MenuViewController
            menuController = vc
            vc.parentController = self
        }
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
    
    func initAlert(){
        // Création d'une alert
        alertLibrary = UIAlertController(title: "Choix d'un type", message: "\n\n\n\n\n\n", preferredStyle: .actionSheet)
        
        // Création de notre action si "Ok"
        let actOk = UIAlertAction(title: "Ok", style: .default) { (bool) in
            
            // On recupere notre type d'Emitter et on recupere les configurations
            // de celui-ci dans notre dictionnaire "config"
            customEmitter.setDictionaryFromCatalogue(Array(catalogueEmitter.catalogue)[self.pickerEmitterType.selectedRow(inComponent: 0)].key)

        }
        
        // Création de notre action "Fermer"
        let actClose = UIAlertAction(title: "Fermer", style: .cancel) { (bool) in
            print("On ne fait rien")
        }
        
        // Initialisation de notre picker
        pickerEmitterType = UIPickerView(frame: CGRect(x: 0, y: 25, width: alertLibrary.view.frame.width - 25, height: 150))
        
        pickerEmitterType.delegate = self
        pickerEmitterType.dataSource = self
        
        
        
        // On ajoute nos actions et notre picker à notre alert
        alertLibrary.addAction(actOk)
        alertLibrary.addAction(actClose)
        alertLibrary.view.addSubview(pickerEmitterType)
    }
    
    // Fonction qui ouvre notre libraire d'emitter
    @IBAction func actOpenLibrary(_ sender: Any) {
        // On affiche notre alert
        self.present(alertLibrary, animated: true, completion: nil)
        
    }
    
}
