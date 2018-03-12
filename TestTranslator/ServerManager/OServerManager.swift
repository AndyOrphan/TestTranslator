//
//  OServerManager.swift
//  TestTranslator
//
//  Created by Orphan on 3/9/18.
//  Copyright © 2018 Orphan. All rights reserved.
//

import UIKit
import Alamofire

class OServerManager: NSObject {

    static let shared = OServerManager()
    
    let mainUrl = "https://gateway.watsonplatform.net/language-translator/api/v2/"
    
    let headers = [
        "Accept": "application/json"
    ]
    
    
    func postTranslate(text: String, from: String, to: String, callback: @escaping (_ result: TranslateResultML,_ code: Int) -> ()) {
        let postData = ["text": text,
                        "source": from,
                        "target": to]
        
        Alamofire.request(mainUrl + "translate", method: .post, parameters: postData, headers: headers).authenticate(user: "190fc6ed-8ec6-4193-9aa0-3c8a54cfa075", password: "VH6JNcD3m8nz").responseJSON(completionHandler: { response in
            
            switch(response.result) {
            case .success(let value):
                //
                print(value)
                guard let responseValue = value as? [String: Any] else {
                    return
                }
                
                
                let resultModel = TranslateResultML().initWith(response: responseValue)
                if let errorCode = responseValue["error_code"] as? Int {
                    callback(resultModel, errorCode)
                } else {
                    callback(resultModel, 201)
                }
                
                //
            case .failure(_):
                break
            }
            
            
        })
        
    }
    
    //
    func getLanguages(callback: @escaping (_ result: [LanguageML]) -> ()) {
        
        Alamofire.request(mainUrl + "identifiable_languages", method: .get, parameters: [:]).authenticate(user: "190fc6ed-8ec6-4193-9aa0-3c8a54cfa075", password: "VH6JNcD3m8nz").responseJSON(completionHandler: { response in
            
            switch(response.result) {
            case .success(let value):
                
                if let dict = value as? [String: Any] {
                    if let array = dict["languages"] as? [[String: Any]] {
                        print(array)
                        var modelArray = [LanguageML]()
                        for element in array {
                            modelArray.append(LanguageML().initWith(response: element))
                        }
                        callback(modelArray)
                    }
                }
            case .failure(_):
                break
            }
        })
    }
}
