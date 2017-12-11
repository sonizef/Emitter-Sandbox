//
//  MySQLConnector.swift
//
//  Created by Joris ZEFIRINI on 14/09/2017.
//  Last update on 02/12/2017
//
//  Copyright © 2017 SoniWeb. All rights reserved.
//

// A VENIR : Passer les parametres via la méthode POST

// NEW
// On peut envoyer un JSON en POST à l'aide de postJson()

import Foundation

// Classe qui permet d'acceder facilement a une base de donnée en ligne
// La communication s'effectue via une API REST
// Pour le moment tout s'effectue avec la méthode GET.

class MySQLConnector{
    
    // On modifie nos constantes en fonction de notre serveur
    let HOST = "http://particule-simulator.soniweb.fr/"
    let FILE = "PSAPI.php"
    var PARAMS = ""
    
    // Constructeur avec ou sans parametres par défaut
    init(_ _PARAMS:String?=nil) {
        if(_PARAMS != nil){
            self.PARAMS = _PARAMS!
        }
    }
    
    // Fonction qui permet de retourner un dictionnaire avec les résultats de notre requete
    // Exemple : SELECT
    func getDatas(completionHandler: @escaping (_ datas:[NSDictionary]) ->()){
        
        let urlPath = "\(self.HOST)\(self.FILE)?\(self.PARAMS)"
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Failed to download data")
                
            }else {
                print("Data downloaded")
                completionHandler(self.parseJSON(data!))
            }
            
        }
        
        task.resume()
        
    }
    
    // Fonction qui POST une chaine de caractere JSON
    // Exemple : INSERT
    func postJson(_ jsonString : String, completionHandler: @escaping (_ datas:Dictionary<String, AnyObject>) ->()){
        
        let urlPath = "\(self.HOST)\(self.FILE)?\(self.PARAMS)"
    
        let url: URL = URL(string: urlPath)!
        
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        let postString = jsonString
        
        request.httpBody = postString.data(using: .utf8)
        
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: request) { (data, response, error) in
        
            if error != nil {
                print("Failed to download data")
    
            }else {
                print("Data downloaded")
                completionHandler(self.parseJSONResult(data!))
            }
                        
        }
                    
        task.resume()
        
    }
    
    // Fonction qui permet d'effectuer une action, lorsqu'on attend aucun retour de donnée
    // Exemple : INSERT / DELETE etc
    func execute(_ _PARAMS:String) -> Bool {
        
        let urlPath = "\(self.HOST)\(self.FILE)?\(_PARAMS)"
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Failed to execute")
                
            }else {
                print("\(_PARAMS) executed")
            }
            
        }
        
        task.resume()

        return true
    }
    
    // Fonction interne à la classe qui parse notre retour JSON pour mettre
    // les résulats dans un dictionnaire
    private func parseJSONResult(_ data:Data) -> Dictionary<String, AnyObject>{
        
        let returnDatas = try! JSONSerialization.jsonObject(with: data, options: []) as AnyObject
        let jsonResult = returnDatas as? Dictionary<String, AnyObject>
        
        return jsonResult!
        
    }
    
    // Fonction interne à la classe qui parse notre retour pour mettre
    // les résulats dans un dictionnaire
    func parseJSON(_ data:Data) -> [NSDictionary]{
        
        var jsonResult = NSArray()
        var result = [NSDictionary]()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement = NSDictionary()
        
        for i in 0 ..< jsonResult.count
        {
            jsonElement = jsonResult[i] as! NSDictionary
            result.append(jsonElement)
        }
        
        return result
        
    }
    
    // Fonction qui permet de modifier nos parametres passé en GET
    func setParams(_ _PARAMS:String?=nil){
        if(_PARAMS != nil){
            self.PARAMS = _PARAMS!
        }
        else{
            self.PARAMS = ""
        }
    }
    
    
    
}

