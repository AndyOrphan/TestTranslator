//
//  MainHelper.swift
//  TestTranslator
//
//  Created by Orphan on 3/11/18.
//  Copyright © 2018 Orphan. All rights reserved.
//

import UIKit

class MainHelper: NSObject {

    static let shared = MainHelper()
    
    var langModelArray = [LanguageML]()
    
    func getLanguages() {
        OServerManager.shared.getLanguages(callback: { result in
            MainHelper.shared.langModelArray = result
        })
    }
    
}
