//
//  AppDelegate.swift
//  Contacts
//
//  Created by Amy Roberson on 1/24/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let splitVC = window?.rootViewController as! MasterViewController
        
         let mainStoryboard = UIStoryboard(name: "Main", bundle: .main)
         let tableStoryBoard = UIStoryboard(name: "ContactsTable", bundle: .main)
        
        let contactStore = ContactStore()
        contactStore.fetchContacts()
        
         let contactTableVC = tableStoryBoard.instantiateInitialViewController() as! ContactsTableViewController
        contactTableVC.dataSource = contactStore
        
         let contactVC = mainStoryboard.instantiateViewController(withIdentifier: "ContactsView")  as! ContactsViewController
        contactVC.dataSource = contactStore
        
         
         
         contactTableVC.selectionClosure = { contact in
            weak var wSelf = contactTableVC
            wSelf?.tableView.reloadData()
            contactVC.contact = contact
            splitVC.showDetailViewController(contactVC, sender: nil)
         }
         
         let masterNav = UINavigationController(rootViewController: contactTableVC)
         let detailNav = UINavigationController(rootViewController: contactVC)
         splitVC.viewControllers = [masterNav, detailNav]
        
        return true
    }



}

