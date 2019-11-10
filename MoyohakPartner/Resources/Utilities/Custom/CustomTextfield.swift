//
//  CustomTextField.swift
//  Swift1
//
//  Created by Angel Broking on 10/11/19.
//  Copyright © 2019 Piyush Kandrikar. All rights reserved.
//

import UIKit

class CustomTextField: UITextField, UITextFieldDelegate {

    var isDoneButtonRequired: Bool = true
    var canKeyboardHideOnReturn: Bool = true
    var noOfMaxCharacters: Int = 0
    var owner: AnyObject?
    var barHeight: CGFloat = 40
    
    
    //MARK: IBInspectable Methods
    
    @IBInspectable
    public var clearButtonRequired: Bool = false {
        didSet {
            self.clearButtonMode = self.clearButtonRequired ? UITextField.ViewMode.whileEditing : UITextField.ViewMode.never
        }
    }
    
    @IBInspectable
    public var doneButtonRequired: Bool = true {
        didSet {
            self.isDoneButtonRequired = self.doneButtonRequired
        }
    }
    
    @IBInspectable
    public var keyboardHideOnReturn: Bool = true {
        didSet {
            self.canKeyboardHideOnReturn = self.keyboardHideOnReturn
        }
    }
    
    @IBInspectable
    public var maxCharacters: Int = 0 {
        didSet {
            self.noOfMaxCharacters = self.maxCharacters
        }
    }
    
    
    //MARK: Init Methods
    override func draw(_ rect: CGRect) {
        self.delegate = self
        
        if isDoneButtonRequired == false{
            barHeight = 0
        }
        
    }
    func setOwner(_ _owner: AnyObject){
        owner = _owner
    }
    
    
    //MARK: Delegate Methods
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if isDoneButtonRequired{
            addToolBarWithDoneButton()
        }
        
        if owner != nil{
            if (owner?.responds(to: #selector(textFieldShouldBeginEditing(_ :))))!{
                _ = owner?.perform(#selector(textFieldShouldBeginEditing(_ :)), with: textField)
            }
        }
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardDidShow(notification:)),
            name: UIResponder.keyboardDidShowNotification,
            object: nil)
        
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if owner != nil{
            if (owner?.responds(to: #selector(textFieldShouldReturn(_ :))))!{
                _ = owner?.perform(#selector(textFieldShouldReturn(_ :)), with: self)
            }
        }
        
        if canKeyboardHideOnReturn{
            doneClicked()
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if owner != nil{
            if (owner?.responds(to: #selector(textFieldDidEndEditing(_ :reason:))))!{
                _ = owner?.perform(#selector(textFieldDidEndEditing(_ :reason:)), with: self)
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if noOfMaxCharacters > 0{
            if(((textField.text?.count)! + ((string == "") ? 0 : 1)) <= noOfMaxCharacters){
                
                if owner != nil{
                    if (owner?.responds(to: #selector(textFieldDidChangeCharacter(_ :))))!{
                        _ = owner?.perform(#selector(textFieldDidChangeCharacter(_ :)), with: string)
                    }
                }
                
                return true
                
            }else{
                return false
            }
        }
        
        if owner != nil{
            if (owner?.responds(to: #selector(textFieldDidChangeCharacter(_ :))))!{
                _ = owner?.perform(#selector(textFieldDidChangeCharacter(_ :)), with: textField.text)
            }
        }
        
        return true
    }
    
    @objc func textFieldDidChangeCharacter(_ text: String) {
        
    }
    
    //MARK: Toolbar Methods
    func addToolBarWithDoneButton(){
        let bar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: AppConstants.SCREEN_WIDTH, height: barHeight))
        //bar.barTintColor = UIColor.white
        
        let space_left: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        let button_done: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(doneClicked))
        bar.setItems([space_left, button_done], animated: true)
        bar.tintColor = UIColor.black
        
        self.inputAccessoryView = bar
    }
    
    @objc func doneClicked(){
        self.resignFirstResponder()
        
        UIView.animate(withDuration: AppConstants.KEYBOARD_ANIMATION_DURATION/2) {
            AppConstants.appDelegate.window?.frame = CGRect(x: (AppConstants.appDelegate.window?.frame.origin.x)!,
                                                            y: 0,
                                                            width: (AppConstants.appDelegate.window?.frame.size.width)!,
                                                            height: (AppConstants.appDelegate.window?.frame.size.height)!)
        }
    }
    
    //MARK: Scroll Methods
    @objc func keyboardDidShow(notification: NSNotification){

        let keyboardRect: CGRect = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey]) as! CGRect
        let keyboardSize: CGSize = keyboardRect.size
        let convertedRectWRT_window: CGPoint = self.convert(CGPoint.zero, to: AppConstants.appDelegate.window)

        let distanceToBottom = (AppConstants.appDelegate.window?.frame.size.height)! - convertedRectWRT_window.y - self.frame.size.height
        let spaceCovered = (keyboardSize.height) - distanceToBottom

        if spaceCovered >= 0{
            UIView.animate(withDuration: (notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey]) as! Double) {
                DispatchQueue.main.async {
                    AppConstants.appDelegate.window?.frame = CGRect(x: (AppConstants.appDelegate.window?.frame.origin.x)!,
                                                                    y: -(spaceCovered + self.frame.size.height),
                                                                    width: (AppConstants.appDelegate.window?.frame.size.width)!,
                                                                    height: (AppConstants.appDelegate.window?.frame.size.height)!)
                }
            }
        }
    }
}
