//
//  String.swift
//  iDev
//
//  Created by Bek Roz on 13.04.2024.
//

import Foundation

extension String {
    var asURL: URL? {
        return URL(string: self)
    }
    
    func logError() -> Void {
        print("🔴 ERROR: \(self)")
    }
    
    func logSuccess() -> Void {
        print("✅ SUCCESS: \(self)")
    }
}
