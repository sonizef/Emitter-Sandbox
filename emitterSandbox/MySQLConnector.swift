//
//  MySQLConnector.swift
//  ParticleSimulator
//
//  Created by Joris ZEFIRINI on 14/09/2017.
//  Copyright © 2017 SoniWeb. All rights reserved.
//

import Foundation

// Classe qui permet une connexion plus simple a une base de donnée externe.

class MySQLConnector{
    
    let HOST = "http://soniweb.net/db/"
    let FILE = "swiftAPI.php"
    var PARAMS = ""
    
    init(_ _PARAMS:String?=nil) {
        if(_PARAMS != nil){
            self.PARAMS = _PARAMS!
        }
    }
    
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
    
    func setParams(_ _PARAMS:String?=nil){
        if(_PARAMS != nil){
            self.PARAMS = _PARAMS!
        }
        else{
            self.PARAMS = ""
        }
    }
    
}
