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
    var selectedToLangCode = "it"
    
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
    
    @IBAction func swapLanguages(_ sender: Any) {
        let textContainer = fromTextView.text ?? ""
        fromTextView.text = toTextView.text ?? ""
        toTextView.text = textContainer
        
        let buttonTextContainer = fromButtomOutlet.titleLabel?.text ?? ""
        fromButtomOutlet.setTitle(toButtonOutlet.titleLabel?.text ?? "", for: .normal)
        toButtonOutlet.setTitle(buttonTextContainer, for: .normal)
        
        let langCodeContainer = selectedFromLangCode
        selectedFromLangCode = selectedToLangCode
        selectedToLangCode = langCodeContainer
    }
    
    @IBAction func fromButtonAction(_ sender: Any) {
        let selectLanguageVC = SelectLanguageVC()
        selectLanguageVC.modalPresentationStyle = .custom
        selectLanguageVC.modalTransitionStyle = .crossDissolve
        
        selectLanguageVC.selectedLanguage = { lang in
            self.fromButtomOutlet.setTitle(lang.langName ?? "", for: .normal)
            self.selectedFromLangCode = lang.langCode ?? "en"
        }
        
        self.present(selectLanguageVC, animated: true, completion: nil)
    }
    
    @IBAction func toButtonAction(_ sender: Any) {
        let selectLanguageVC: SelectLanguageVC = SelectLanguageVC()
        selectLanguageVC.modalPresentationStyle = .custom
        selectLanguageVC.modalTransitionStyle = .crossDissolve
        
        selectLanguageVC.selectedLanguage = { lang in
            self.toButtonOutlet.setTitle(lang.langName ?? "", for: .normal)
            self.selectedToLangCode = lang.langCode ?? "it"
        }
        
        self.present(selectLanguageVC, animated: true, completion: nil)
    }
    
    
    // MARK: Server Methods
    
    func translate(text: String) {
        OServerManager.shared.postTranslate(text: text,
                                            from: selectedFromLangCode,
                                            to: selectedToLangCode,
                                            callback: { (result, code) in
                                                self.toTextView.text = result.translatedText ?? ""
                                                if code != 201 {
                                                    MainHelper.shared.showErrorAlert(sender: self, message: "Server Error")
                                                }
                                                })
    }

}

extension ViewController: UITextViewDelegate, UINavigationControllerDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return true
    }
}





