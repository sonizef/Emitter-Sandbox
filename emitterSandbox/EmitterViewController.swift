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

class EmitterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UIWebViewDelegate{
    
    // Déclaration de nos outlets
    @IBOutlet weak var menu: UIView!
    @IBOutlet weak var icnWebview: UIBarButtonItem!
    
    // Déclaration de nos variables statics
    static var menuIsOpen : Bool = false
    
    // Déclaration de nos constantes
    let urlRequest = URLRequest(url: URL(string: "http://particule-simulator.soniweb.fr/gallery.php")!)

    // Déclaration de nos variables
    var menuController : MenuViewController!
    var scene : EmitterScene!
    var alertLibrary : UIAlertController!
    var pickerEmitterType : UIPickerView!
    var webView : UIWebView!
    var webViewIsOpen : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // On place notre menu fermé de manière responsive sur l'écran
        menu.frame = CGRect(x: self.view.frame.width, y: (self.navigationController?.navigationBar.bounds.height)!, width: self.view.frame.width*0.5, height: self.view.frame.height - (self.navigationController?.navigationBar.bounds.height)!)
        
        
        // On met à jour les sliders du menu
        menuController.updateSliderFrom()
        
        // Création de notre alert ( bibliotheque )
        initAlert()
        
        // On configure notre webview
        webView = UIWebView(frame: self.view.frame)
        webView.scrollView.bounces = false
        
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
                    
                    view.showsFPS = false
                    view.showsNodeCount = false
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
        
        // Création de notre action "Ok"
        let actOk = UIAlertAction(title: "Ok", style: .default) { (bool) in
            
            // On recupere notre type d'Emitter et on recupere les configurations
            // de celui-ci dans notre dictionnaire "config"
            customEmitter.setDictionaryFromCatalogue(Array(catalogueEmitter.catalogue)[self.pickerEmitterType.selectedRow(inComponent: 0)].key)
            
            // Une fois notre dictionnaire à jour on appelle la fonction qui met
            // à jour nos sliders
            self.menuController.updateSliderFrom()
            

        }
        
        // Création de notre action "Fermer"
        let actClose = UIAlertAction(title: "Fermer", style: .cancel) { (bool) in

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
        
        // Si le menu de configuration est ouvert, alors on le ferme
        if(EmitterViewController.menuIsOpen){
            closeMenu()
        }
        
        // On affiche notre alert
        self.present(alertLibrary, animated: true, completion: nil)
        
    }
    
    // Lorsqu'on clic sur le bouton "Save"
    @IBAction func actSave(_ sender: Any) {
        
        // On créer et configue nos alerts
        let alertSave = UIAlertController(title: "Sauvegarder", message: "Sauvegarder votre générateur de particule sur notre site ?", preferredStyle:.alert )
        let alertUpload = UIAlertController(title: "Uploader", message: "Donner un nom à votre générateur \n", preferredStyle: .alert)
        let alertError = UIAlertController(title: "Erreur", message: "Vous devez mettre un nom", preferredStyle: .alert)
        
        let txtNomCustomEmitter = UITextField(frame: CGRect(x: 10, y: 60, width: alertUpload.view.frame.width-80, height: 30))
        txtNomCustomEmitter.placeholder = "Exemple : Flamme"
        
        txtNomCustomEmitter.delegate = self
        
        // On ajoute les actions liés aux alerts
        alertSave.addAction(UIAlertAction(title: "Oui", style: .default, handler: { (Bool) in
            // On affiche l'alert qui demande le nom et upload notre configuration
            self.present(alertUpload, animated: true, completion: nil)
        }))
        alertSave.addAction(UIAlertAction(title: "Non", style: .cancel, handler: nil))

        alertUpload.addAction(UIAlertAction(title: "Oui", style: .default, handler: { (Bool) in
            // On envoi notre configuration sur le serveur
            if(txtNomCustomEmitter.text == nil || txtNomCustomEmitter.text == ""){
                self.present(alertError, animated: true, completion: nil)
            }
            else{
                self.uploadCustomEmitter(txtNomCustomEmitter.text!)
            }
        }))
        alertUpload.addAction(UIAlertAction(title: "Annuler", style: .cancel, handler: nil))
        alertUpload.view.addSubview(txtNomCustomEmitter)
        
        alertError.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (Bool) in
            self.present(alertUpload, animated: true, completion: nil)
        }))
        
        self.present(alertSave, animated: true, completion: nil)
        
    }
    
    // Lorsqu'on clique sur le bouton webview
    @IBAction func actWeb(_ sender: Any) {
        if(webViewIsOpen){
            closeWebView()
        }
        else{
            openWebView()
        }
        
    }
    
    // Permet de sauvegarder l'emitter sur le serveur
    func uploadCustomEmitter(_ nom : String){
        
        let alertSuccess = UIAlertController(title: "Succès", message: "Retrouvez votre générateur sur le site : \n http://particule-simulator.soniweb.net", preferredStyle: .actionSheet)
        alertSuccess.addAction(UIAlertAction(title: "D'accord !", style: .default, handler: nil))
        
        // On créer notre objet MySQLConnector
        let mysqlconnect = MySQLConnector()
        
        // On prépare notre requete
        let req = "nom="+nom+"&addCustomEmitter={"+customEmitter.getJSONArray()+"}"

        // On POST notre requete
        mysqlconnect.postJson(req, completionHandler: { (datas) in

            // On affiche l'alert succès
            self.present(alertSuccess, animated: true, completion: nil)
        })
    }
    
    // Fonction qui ouvre la webview
    func openWebView(){
        icnWebview.image = UIImage(named: "icnClose")
        self.view.addSubview(webView)
        webView.loadRequest(urlRequest)
        webViewIsOpen = true
    }
    
    // Fonction qui ferme la webview
    func closeWebView(){
        icnWebview.image = UIImage(named: "icnWeb")
        webView.removeFromSuperview()
        webViewIsOpen = false
    }
   
}
