//
//  LanguageML.swift
//  TestTranslator
//
//  Created by Orphan on 3/11/18.
//  Copyright © 2018 Orphan. All rights reserved.
//

import UIKit

class LanguageML: NSObject {

    var langCode: String?
    var langName: String?
    
    func initWith(response: [String: Any]) -> LanguageML {
        let model = self
        model.langCode = response["language"] as? String
        model.langName = response["name"] as? String
        return model
    }
    
}
