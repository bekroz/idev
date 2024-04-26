//
//  UIApplication.swift
//  iDev
//
//  Created by Bek Roz on 24.04.2024.
//

import SwiftUI

extension UIApplication {
    var firstKeyWindow: UIWindow? {
        return UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .filter { $0.activationState == .foregroundActive }
            .first?.keyWindow
    }
    
    var rootVC: UIViewController? {
        guard let rootVC = self.firstKeyWindow?.rootViewController else { return nil }
        return rootVC
    }


    func setStatusBarStyle(_ style: UIStatusBarStyle) {
        if let controller = self.rootVC as? ContentHostingController {
            controller.changeStatusBarStyle(style)
        }
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    static var appVersion: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    }
    
    static var buildNumber: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion")  as! String
    }
}


class ContentHostingController: UIHostingController<AnyView> {

  private var currentStatusBarStyle: UIStatusBarStyle = .default

  override var preferredStatusBarStyle: UIStatusBarStyle {
    currentStatusBarStyle
  }

  func changeStatusBarStyle(_ style: UIStatusBarStyle) {
    self.currentStatusBarStyle = style
    self.setNeedsStatusBarAppearanceUpdate()
  }
}
