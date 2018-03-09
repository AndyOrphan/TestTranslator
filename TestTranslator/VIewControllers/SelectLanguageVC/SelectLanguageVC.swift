//
//  SelectLanguageVC.swift
//  TestTranslator
//
//  Created by Orphan on 3/9/18.
//  Copyright © 2018 Orphan. All rights reserved.
//

import UIKit

class SelectLanguageVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var selectLanguagePicker: UIPickerView!
    
    var selectedLanguage: ((String) -> (Void))?
    var languagesArray = [String]()
    
    let uiTapGesture = UITapGestureRecognizer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTap()
        fillLangArray()
        // Do any additional setup after loading the view.
    }
    
    // MARK: Settings
    
    func addTap() {
        uiTapGesture.addTarget(self, action: #selector(onTap))
        view.addGestureRecognizer(uiTapGesture)
    }
    
    func fillLangArray() {
        languagesArray = ["English", "Українська", "Русский"]
    }
    
    // MARK: Actions
    
    @IBAction func saveButtonAction(_ sender: Any) {
        if let lang = selectedLanguage {
            lang(languagesArray[selectLanguagePicker.selectedRow(inComponent: 0)])
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func onTap() {
        self.view.endEditing(true)
    }
    
    // MARK: PickerView Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languagesArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return languagesArray[row]
    }
    
    

}
