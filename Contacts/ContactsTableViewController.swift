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
    let dataSource = ContactsTableDataSource()
    
    
    var selectionClosure: (Contact) -> Void = { contact in
        print("selected \(contact)")
    }
    @IBAction func addContactButtonPressed(_ sender: UIBarButtonItem) {
        let storyBoard = UIStoryboard(name:"ContactsTable", bundle: nil)
        let addVC: AddContactViewController = storyBoard.instantiateViewController(withIdentifier: "Add") as! AddContactViewController
        addVC.delegate = self
        self.show(addVC, sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ContactCell")
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = dataSource[indexPath.row]
        
        selectionClosure(contact)
    }
}

final class ContactsTableDataSource: NSObject, UITableViewDataSource {
    //var dataSource = ContactStore()
    var list: [Contact] = []
    
    subscript(_ index: Int) -> Contact {
        return list[index]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    
    func  tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell") else {
            fatalError("failed to dequeue cell")
        }
        cell.textLabel?.text = list[indexPath.row].fullName

        return cell
    }
    
}
