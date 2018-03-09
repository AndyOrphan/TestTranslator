//
//  TranslateResultML.swift
//  TestTranslator
//
//  Created by Orphan on 3/9/18.
//  Copyright © 2018 Orphan. All rights reserved.
//

import UIKit

class TranslateResultML: NSObject {

    var translatedText: String? = nil
    
    func initWith(response: [String: Any]) -> TranslateResultML {
        let model = self
     
        model.translatedText = response["text"] as? String
        
        return model
    }
    
}
