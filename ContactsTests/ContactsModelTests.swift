//
//  ContactsModelTests.swift
//  Contacts
//
//  Created by Amy Roberson on 1/24/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import XCTest
@testable import Contacts
class ContactsModelTests: XCTestCase {
    
    func testINITs(){
        let defaultDate = Date(timeIntervalSince1970: 5)
        let bob = Contact(givenName: "Bob", familyName: "Smith", address: "522 Peachford circle Atlanta,GA 30323", email: "amy@roberson.xyz", phone: "555-555-5555", birthday: defaultDate, note: "testing")
        let dictionary = bob.toDictionary()
        let bob1 = Contact(dictionary: dictionary)
        XCTAssertNotNil(bob1)
        XCTAssertEqual((bob1?.givenName)!, bob.givenName)
        XCTAssertEqual((bob1?.note)!, bob.note)
        XCTAssertEqual((bob1?.address)!, bob.address)
        XCTAssertEqual((bob1?.phone)!, bob.phone)
    }
    
}
