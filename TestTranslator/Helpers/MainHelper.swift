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
    
    func showErrorAlert(sender: UIViewController, message: String) {
        let alertcontroller = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: {Void in
            alertcontroller.dismiss(animated: true, completion: nil)
        })
        alertcontroller.addAction(okAction)
        sender.present(alertcontroller, animated: true, completion: nil)
    }
    
}
