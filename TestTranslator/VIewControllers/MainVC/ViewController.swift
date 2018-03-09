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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        oSettings()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func oSettings() {
        customizeNavigationBar()
    }
    
    // MARK: UI Methods
    func customizeNavigationBar() {
        //let navBarText = "TestTranslator"
        //TODO
        //let attributedNavBarString = NSAttributedString(string: navBarText, attributes: [nsfore])
        navigationItem.title = "TestTranslator"
        navigationController?.navigationBar.barTintColor = UIColor.init(red: 30/255, green: 136/255, blue: 229/255, alpha: 1)
        navigationController?.navigationBar.tintColor = UIColor.white
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    // MARK: Actions
    

    @IBAction func fromButtonAction(_ sender: Any) {
    }
    
    @IBAction func toButtonAction(_ sender: Any) {
    }
    
    
    // MARK: Server Methods
    
    func translate(text: String) {
        
    }

}

extension ViewController: UITextViewDelegate, UINavigationControllerDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return true
    }
}





