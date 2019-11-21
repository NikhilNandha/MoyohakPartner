//
//  OTPViewController.swift
//  MoyohakPartner
//
//  Created by Nikhil Nandha on 10/11/19.
//  Copyright © 2019 Nikhil Nandha. All rights reserved.
//

import UIKit

class OTPViewController: SuperViewController, UITextFieldDelegate {

    @IBOutlet var textfield1: UITextField!
    @IBOutlet var textfield2: UITextField!
    @IBOutlet var textfield3: UITextField!
    @IBOutlet var textfield4: UITextField!
    
    @IBOutlet var viewTF1: UIView!
    @IBOutlet var viewTF2: UIView!
    @IBOutlet var viewTF3: UIView!
    @IBOutlet var viewTF4: UIView!
    
    @IBOutlet var labelTitle: UILabel!
    
    var textfields = [UITextField]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        textfields = [textfield1, textfield2, textfield3, textfield4]
        
        setUpScreen()
        textfield1.becomeFirstResponder()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    // MARK: - UI Methods -
    
    
    func setUpScreen() {
        
        viewTF1.layer.cornerRadius = viewTF1.bounds.size.width/2;
        viewTF2.layer.cornerRadius = viewTF2.bounds.size.width/2;
        viewTF3.layer.cornerRadius = viewTF3.bounds.size.width/2;
        viewTF4.layer.cornerRadius = viewTF4.bounds.size.width/2;
        
        setupTextfieldBGColor()
    }
    
    func setupTextfieldBGColor() {
        
        viewTF1.backgroundColor = textfield1.text == "" ? UIColor.white : UIColor.ThemeColorGreen
        viewTF2.backgroundColor = textfield2.text == "" ? UIColor.white : UIColor.ThemeColorGreen
        viewTF3.backgroundColor = textfield3.text == "" ? UIColor.white : UIColor.ThemeColorGreen
        viewTF4.backgroundColor = textfield4.text == "" ? UIColor.white : UIColor.ThemeColorGreen
        
    }
    
    
    // MARK: - Textfield Methods -
    
        
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let text = textField.text,
           let textRange = Range(range, in: text)
        {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
           
            if updatedText.count == 1 {
                    
                //Enter text into Textfield
                if textField.tag <= 3 {
                    textField.text = updatedText
                }
                
                //Start editing next textfield
                if textField.tag < 3 {
                    let nextTextfield = textfields[textField.tag+1]
                    nextTextfield.becomeFirstResponder()
                }
                
            }else if updatedText.count == 0 {
                
//                //start editing previous textfield
//                if textField.tag > 0 && updatedText.count == textField.text?.count ?? 0 {
//                    let prevTextfield = textfields[textField.tag-1]
//                    prevTextfield.becomeFirstResponder()
//                }
                
                //Enter text into Textfield
                if textField.tag >= 0 {
                    textField.text = updatedText
                }
                
            }
            
            textField.backgroundColor = updatedText == "" ? UIColor.white : UIColor.ThemeColorGreen
        }
        
        return false
    }
    
    
    // MARK: - Button Tapped Event -

    @IBAction func proceedButtonTapped() {
        RegistrationViewModel.showVendorRegistrationScreen(navigationType: .Push, parentViewController: self)
    }

    @IBAction func resendButtonTapped() {
        
    }
    
    @IBAction func backButtonTapped() {
        ViewNavigator.shared.navigateBack()
    }
    
}
