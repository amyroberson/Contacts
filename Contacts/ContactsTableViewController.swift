//
//  ContactsTableViewController.swift
//  Contacts
//
//  Created by Amy Roberson on 1/24/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation
import UIKit

class ContactsTableViewController: UITableViewController {
    var dataSource: ContactStore?
    
    var list: [Contact] = [Contact(givenName: "Bob", familyName: "Smith", address: "522 Peachford circle Atlanta,GA 30323", email: "amy@roberson.xyz", phone: "555-555-5555", birthday: Date(), note: "testing")]
    
    subscript(_ index: Int) -> Contact {
        return list[index]
    }
    
    var selectionClosure: (Contact) -> Void = { contact in
        print("selected \(contact)")
    }
    @IBAction func addContactButtonPressed(_ sender: UIBarButtonItem) {
        let storyBoard = UIStoryboard(name:"ContactsTable", bundle: nil)
        let addVC: AddContactViewController = storyBoard.instantiateViewController(withIdentifier: "Add") as! AddContactViewController
        if let data = self.dataSource {
            addVC.dataSource = data
        }
        addVC.delegate = self
        self.show(addVC, sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ContactCell")
        tableView.dataSource = self
        tableView.reloadData()
        list = (dataSource?.contacts) ?? []
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = list[indexPath.row]
        
        selectionClosure(contact)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    
    override func  tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell") else {
            fatalError("failed to dequeue cell")
        }
        cell.textLabel?.text = list[indexPath.row].fullName

        return cell
    }
    
}
