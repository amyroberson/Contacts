//
//  EditContactViewController.swift
//  Contacts
//
//  Created by Amy Roberson on 1/24/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation
import UIKit

class EditContactViewController:  UIViewController, UITextFieldDelegate {
    
    //var dataSource
    //var contactIndex: Int
    var contact: Contact?
   
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var noteTextField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func editButtonPressed(_ sender: UIButton) {
        if let first = firstNameTextField.text,
            let last = lastNameTextField.text,
            let address = addressTextField.text,
            let phone = phoneTextField.text,
            let email = emailTextField.text,
            let note = noteTextField.text,
            let thisContact = contact{
            thisContact.givenName = first
            thisContact.familyName = last
            thisContact.address = address
            thisContact.phone = phone
            thisContact.email = email
            thisContact.note = note
            thisContact.birthday = datePicker.date
            //dataSource?[contactIndex?] = thisContact
        }
        
        //save here
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        addressTextField.delegate = self
        phoneTextField.delegate = self
        emailTextField.delegate = self
        noteTextField.delegate = self
        firstNameTextField.text = contact?.givenName
        lastNameTextField.text = contact?.familyName
        addressTextField.text = contact?.address
        phoneTextField.text = contact?.phone
        emailTextField.text = contact?.email
        noteTextField.text = contact?.note
        datePicker.date = contact?.birthday ?? Date()
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text?.isEmpty == false{
            textField.resignFirstResponder()
            
            return true
        }
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text?.isEmpty == false{
            textField.resignFirstResponder()
            return true
        }
        return false
    }
    
}
