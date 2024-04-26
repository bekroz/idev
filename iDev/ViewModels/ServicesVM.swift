//
//  ServicesVM.swift
//  iDev
//
//  Created by Bek Roz on 13.04.2024.
//

import Foundation
import SafariServices

class ServicesVM: ObservableObject {
    static let shared = ServicesVM()
    @Published var data: Services = []
        
    private let services = [
        "github",
        "gitlab",
        "bitbucket",
        "vercel",
        "cloudflare"
    ]
    
    func fetch() {
        self.data = self.services.map({ name in
            Service(name: name)
        })
    }
    
    func authorizeWakatime() {
        let urlString = "https://wakatime.com/oauth/authorize?client_id=7yXaXGdUOzvqy6E5y4DuaRHq&response_type=token&redirect_uri=https://bekroz.com&scope=read_logged_time"
        
        if let url = URL(string: urlString) {
            let safariViewController = SFSafariViewController(url: url)
            UIApplication.shared.rootVC?.present(safariViewController, animated: true, completion: nil)
        }
    }
}

