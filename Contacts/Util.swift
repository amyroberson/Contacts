//
//  Util.swift
//  Contacts
//
//  Created by Amy Roberson on 1/24/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation

enum DateError: Error {
    case dateParserError
}

struct Util {
    
    private static var dateFormatter: DateFormatter?
    
    static func getDateFormatter() -> DateFormatter {
        
        if dateFormatter == nil {
            dateFormatter = DateFormatter()
            dateFormatter?.dateStyle = .long
            dateFormatter?.timeStyle = .long
            dateFormatter?.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter?.dateFormat = "dd-MM-yyyy"
            dateFormatter?.timeZone = TimeZone(secondsFromGMT: 0)
        }
        
        return dateFormatter!
    }
}

extension Date {
    public func toString() -> String {
        let formatter = Util.getDateFormatter()
        return formatter.string(from: self)
    }
}

extension String {
    public func toDate() throws -> Date {
        let formatter = Util.getDateFormatter()
        if let dateFromString = formatter.date(from: self){
            return dateFromString
        } else {
            throw DateError.dateParserError
        }
    }
}
