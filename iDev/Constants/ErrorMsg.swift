//
//  ErrorMsg.swift
//  iDev
//
//  Created by Bek Roz on 13.04.2024.
//

import Foundation

enum ErrorMsg {
    case loginCancelled,
         pushNotificationPermissionDenied,
         jsonDecoding,
         invalidURL,
         invalidData,
         userLocationNotAvailable

    var str: String {
        switch self {
        case .loginCancelled: return "Login was cancelled."
        case .pushNotificationPermissionDenied: return "Permission for push notifications denied."
        case .jsonDecoding: return "Decoding JSON failed."
        case .invalidURL: return "URL is invalid"
        case .invalidData: return "Data is invalid"
        case .userLocationNotAvailable: return "User location is not available"
        }
    }
    
    func log() {
        self.str.logError()
    }
}
