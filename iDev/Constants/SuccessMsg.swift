//
//  SuccessMsg.swift
//  iDev
//
//  Created by Bek Roz on 13.04.2024.
//

import Foundation

enum SuccessMsg {
    case fetched,
         apnsRegistered,
         trackingAuthorized
    
    var str: String {
        switch self {
        case .fetched: return "Data fetched successfully"
        case .apnsRegistered: return "APNS Registered for Apple Remote Notifications"
        case .trackingAuthorized: return "Tracking Authorized"
        }
    }
    
    func log() {
        self.str.logSuccess()
    }
}
