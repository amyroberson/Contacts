//
//  Contact.swift
//  Contacts
//
//  Created by Amy Roberson on 1/24/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation


@objc class Contact: NSObject {
    var givenName: String
    var familyName: String
    var address: String
    var email: String
    var phone: String
    var birthday: Date
    var note: String
    var birthdayString: String {
        return birthday.toString()
    }
    
    init(givenName:String, familyName: String, address: String, email: String, phone: String, birthday: Date, note: String) {
        self.givenName = givenName
        self.familyName = familyName
        self.address = address
        self.email = email
        self.phone = phone
        self.birthday = birthday
        self.note = note
    }
    
    convenience init?(dictionary: [String: Any]) {
        if let firstname = dictionary["givenName"] as? String,
            let lastName = dictionary["familyName"] as? String,
            let address = dictionary["address"] as? String,
            let email = dictionary["email"] as? String,
            let phone = dictionary["phone"] as? String,
            let birthday = dictionary["birthday"] as? String,
            let note =  dictionary["note"] as? String {
                do{
                    let birthdayDate = try birthday.toDate()
                    self.init(givenName: firstname, familyName: lastName, address: address, email: email, phone: phone, birthday: birthdayDate, note: note)
                    return
                } catch {
                    print("no birthday")
                    return nil
                }
        } else {
            return nil
        }
    }
    
    
    
    func toDictionary() -> [String: Any] {
        let dictionary: [String : Any] = [
            "givenName" : self.givenName,
            "familyName" : self.familyName,
            "address" : self.address,
            "email" : self.email,
            "phone" : self.phone,
            "birthday" : self.birthday.toString(),
            "note" : self.note]
        return dictionary
    }
    override var description: String {
        return fullName
    }
}


extension Contact {
    var nameComponents: PersonNameComponents {
        var parts = PersonNameComponents()
        parts.givenName = givenName
        parts.familyName = familyName
        return parts
    }
    var fullName: String {
        let formatter = PersonNameComponentsFormatter()
        return formatter.string(from: nameComponents)
    }
}

