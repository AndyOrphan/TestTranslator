//
//  ViewController.swift
//  TestTranslator
//
//  Created by Orphan on 3/9/18.
//  Copyright © 2018 Orphan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var toTextView: UITextView!
    @IBOutlet weak var fromTextView: UITextView!
    @IBOutlet weak var toButtonOutlet: UIButton!
    @IBOutlet weak var fromButtomOutlet: UIButton!
    
    var selectedFromLangCode = "en"
    var selectedToLangCode = "ua"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        oSettings()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Settings
    
    func oSettings() {
        customizeNavigationBar()
    }
    
    // MARK: UI Methods
    func customizeNavigationBar() {
        navigationItem.title = "TestTranslator"
        
        navigationController?.navigationBar.barTintColor = UIColor.init(red: 30/255, green: 136/255, blue: 229/255, alpha: 1)
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    // MARK: Actions

    @IBAction func translateButtonAction(_ sender: Any) {
        translate(text: fromTextView.text ?? "")
    }
    
    @IBAction func fromButtonAction(_ sender: Any) {
        let selectLanguageVC = SelectLanguageVC()
        selectLanguageVC.modalPresentationStyle = .custom
        selectLanguageVC.modalTransitionStyle = .crossDissolve
        
        selectLanguageVC.selectedLanguage = { lang in
            self.fromButtomOutlet.setTitle(lang, for: .normal)
            self.selectedFromLangCode = Consts.langDict[lang] ?? "en"
        }
        
        self.present(selectLanguageVC, animated: true, completion: nil)
    }
    
    @IBAction func toButtonAction(_ sender: Any) {
        let selectLanguageVC: SelectLanguageVC = SelectLanguageVC()
        selectLanguageVC.modalPresentationStyle = .custom
        selectLanguageVC.modalTransitionStyle = .crossDissolve
        
        selectLanguageVC.selectedLanguage = { lang in
            self.toButtonOutlet.setTitle(lang, for: .normal)
            self.selectedToLangCode = Consts.langDict[lang] ?? "ua"
        }
        
        self.present(selectLanguageVC, animated: true, completion: nil)
    }
    
    
    // MARK: Server Methods
    
    func translate(text: String) {
        OServerManager.shared.postTranslate(text: text,
                                            from: selectedFromLangCode,
                                            to: selectedToLangCode,
                                            callback: { (result) in
                                                self.toTextView.text = result.translatedText ?? ""
                                                })
    }

}

extension ViewController: UITextViewDelegate, UINavigationControllerDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return true
    }
}





