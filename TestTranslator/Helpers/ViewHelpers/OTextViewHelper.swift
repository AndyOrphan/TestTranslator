//
//  OTextViewHelper.swift
//  TestTranslator
//
//  Created by Orphan on 3/10/18.
//  Copyright © 2018 Orphan. All rights reserved.
//

import UIKit

class OTextViewHelper: UITextView {

    @IBInspectable var isBorderActive: Bool = false {
        didSet {
            
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.black
    @IBInspectable var borderWidth: CGFloat = 1
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = cornerRadius
        if isBorderActive {
            self.layer.borderColor = borderColor.cgColor
            self.layer.borderWidth = borderWidth
        }
    }
 
    
}
