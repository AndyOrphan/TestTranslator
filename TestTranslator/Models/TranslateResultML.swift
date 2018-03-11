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
     
        guard let translations = response["translations"] as? [Any] else {
            return model
        }
        
        guard let firstTranslation = translations.first as? [String : Any] else {
            return model
        }
        
        model.translatedText = firstTranslation["translation"] as? String
        
        return model
    }
    
}
