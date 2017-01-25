//
//  AddContactViewController.swift
//  Contacts
//
//  Created by Amy Roberson on 1/24/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation
import UIKit

class AddContactViewController: UIViewController{
    
    var delegate: ContactsTableViewController?
    var dataSource: ContactStore?
   
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var noteTextField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func addContactButtonPressed(_ sender: UIButton) {
        if let first = firstNameTextField.text,
            let last = lastNameTextField.text,
            let address = addressTextField.text,
            let phone = phoneTextField.text,
            let email = emailTextField.text,
            let note = noteTextField.text {
            let thisContact = Contact(givenName: first, familyName: last, address: address, email: email, phone: phone, birthday: datePicker.date, note: note)
            dataSource?.contacts.append(thisContact)
        }
       
        do {
            try dataSource?.saveContacts()
            dataSource?.fetchContacts()

        } catch {
            print("failed to save")
        }
        delegate?.tableView.reloadData()
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    
    
}
