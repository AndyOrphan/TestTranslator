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
    
    let mainUrl = "https://api.unbabel.com/tapi/v2/"
    
    let headers = [
        "Content-Type": "application/json"
    ]
    
    func postTranslate(text: String, from: String, to: String, callback: @escaping (_ result: TranslateResultML) -> ()) {
        let postData = ["text": text,
                        "source_language": from,
                        "target_language": to,
                        "text_format": "text"]
        
        Alamofire.request(mainUrl + "translation/", method: .post, parameters: postData, headers: headers).responseJSON(completionHandler: { response in
            
            switch(response.result) {
            case .success(let value):
                //
                print(value)
                guard let responseValue = value as? [String: Any] else {
                    return
                }
                
                let resultModel = TranslateResultML().initWith(response: responseValue)
                
                callback(resultModel)
                //
            case .failure(_):
                break
            }
            
            
        })
        
    }
    
}
