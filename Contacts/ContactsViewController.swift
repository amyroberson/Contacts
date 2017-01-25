//
//  ContactsViewController.swift
//  Contacts
//
//  Created by Amy Roberson on 1/24/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {

    var dataSource: ContactStore?
    var index: Int?
    var contact: Contact? {
        didSet{
            updateUI()
        }
    }
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    @IBAction func editButtonPressed(_ sender: Any) {
        let storyBoard = UIStoryboard(name:"Main", bundle: nil)
        let editVC: EditContactViewController = storyBoard.instantiateViewController(withIdentifier: "Edit") as! EditContactViewController
        editVC.contact = self.contact
        if let data = self.dataSource {
            editVC.dataSource = data
        }
        self.show(editVC, sender: nil)
        
        
    }

    func updateUI(){
        fullNameLabel.text =  contact?.fullName
        addressLabel.text = contact?.address
        phoneNumberLabel.text = contact?.phone
        birthdayLabel.text = contact?.birthdayString
        noteLabel.text = contact?.note
    }
    
}
