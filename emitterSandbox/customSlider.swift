//
//  customSlider.swift
//  emitterSandbox
//
//  Created by Joris ZEFIRINI on 25/11/2017.
//  Copyright © 2017 SoniWeb. All rights reserved.
//

import UIKit

class customSlider: UISlider {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
     }
    */
    
    // Déclarations de nos variables
    var viewLabel : UIView!
    var lblValue : UILabel!
    var pos : CGFloat = 0
    var isAngle = false
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        // On configure notre affichage
        viewLabel = UIView(frame: CGRect(x: 0, y: -self.frame.height , width: 35, height: self.frame.height))
        viewLabel.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.1)
        viewLabel.layer.cornerRadius = 10
        
        
        lblValue = UILabel(frame: CGRect(x: 0, y: 0, width: viewLabel.frame.width, height: viewLabel.frame.height))
        lblValue.textAlignment = .center
        lblValue.font = lblValue.font.withSize(10)
        // On arrondie notre Float en Int pour l'affichage
        lblValue.text = String(Int(self.value))
        // On pense à le masquer au début
        viewLabel.alpha = 0;
        
        // On ajoute notre label à notre UISlider
        viewLabel.addSubview(lblValue)
        self.addSubview(viewLabel)
        
    }
    
    // Fonction qui met à jour le label avec la valeur courante et la position correspondante
    // Appelée à chaque action sur notre slider
    private func updateLbl(){
        
        // Si ce n'est pas un angle on affiche la valeur courante
        if(!isAngle){
            lblValue.text = String(Int(self.value))
        }
        // Si c'est un angle on effectue une conversion radian -> degrée
        // Pour un affichage plus simple
        else{
            lblValue.text = "\(Int((self.value * 180) / Float.pi))°"
        }
        
    }
    
    
    // Lorsqu'on touche notre slider
    // On fait apparaitre notre label
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // On appelle la fonction parente qui gère l'événement du slider
        super.touchesBegan(touches, with: event)
        
        // Animation qui fait apparaitre notre label
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseIn, animations: {
            self.viewLabel.alpha = 1
        }, completion: nil)
        
        // On met à jour notre label
        updateLbl()
        
    }
    
    // Lorsque notre doigt bouge sur le slider
    // On met à jour la valeur du label
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // On appelle la fonction parente qui gère l'événement du slider
        super.touchesMoved(touches, with: event)
        
        // On met à jour notre label
        updateLbl()
        
        UIView.animate(withDuration: 0) {
            self.viewLabel.transform = CGAffineTransform(translationX: self.pos, y: 0)
        }
    }
    
    // Lorsqu'on retire notre doigt du slider
    // On fait disparaitre notre label
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // On appelle la fonction parente qui gère l'événement du slider
        super.touchesEnded(touches, with: event)
        
        // Animation qui fait disparaitre notre label
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseOut, animations: {
            self.viewLabel.alpha = 0
        }, completion: nil)
        
        // On met à jour notre label
        updateLbl()
    }
}
