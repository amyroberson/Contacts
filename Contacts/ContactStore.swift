//
//  ContactStore.swift
//  Contacts
//
//  Created by Amy Roberson on 1/24/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation
import UIKit


enum FileError: Error{
    case noSupportDirectory
    case failedToWrite
    case failedToRead
}

final class ContactStore: NSObject {
    
    var contacts: [Contact] = []
    
    func getContactsFilePath() throws -> URL {
        guard let supportDir = FileManager.default.urls(for: .applicationDirectory, in: .userDomainMask).first else {
            throw FileError.noSupportDirectory
        }
        var supportFile = supportDir.appendingPathComponent("Contacts")
        try FileManager.default.createDirectory(at: supportFile, withIntermediateDirectories: true, attributes: nil)
        supportFile = supportFile.appendingPathComponent("Contact")
        return supportFile
    }
    
    func fetchContacts() {
        do{
            let file = try getContactsFilePath()
            if FileManager.default.fileExists(atPath: file.path) {
                do{
                    let tmp = try readJson(json: try Data(contentsOf: file))
                    contacts = tmp
                } catch {
                    print("Error in Fetch")
                }
            }
        } catch {
            print("Error in Fetch")
            
        }
    }
    
    func saveContacts() throws {
        let contactsToSave = try self.toJson()
        do {
            let file = try getContactsFilePath()
            try contactsToSave.write(to: file)
        } catch {
            throw FileError.failedToWrite
        }
    }
    
    func toJson() throws -> Data {
        let jsonRepresentation = try JSONSerialization.data(withJSONObject: contacts.map { $0.toDictionary() }, options: [])
        return jsonRepresentation
    }
    
    func readJson(json: Data) throws -> [Contact] {
        do {
            guard let jsonObject = try JSONSerialization.jsonObject(with: json, options: []) as? [[String: Any]] else {
                return []
            }
            if let temp = jsonObject.map({ Contact(dictionary: $0) }) as? [Contact] {
                return temp
            } else {
                return []
            }
        } catch {
            throw FileError.failedToRead
        }
    }
    
}
