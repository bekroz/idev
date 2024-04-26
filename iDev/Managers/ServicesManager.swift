//
//  ServicesManager.swift
//  iDev
//
//  Created by Bek Roz on 13.04.2024.
//

import Foundation

class ServicesManager: ObservableObject {
    static let shared = ServicesManager()
    
    @Published var github: GithubApiResponse? = nil

    func fetchGithubData(_ username: String) {
        guard let url = URL(string: "https://api.github.com/users/\(username)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let self = self else { return }
            
            if let error = error {
                error.localizedDescription.logError()
                return
            }
            
            if let data = data {
                do {
                    let githubResponse = try JSONDecoder().decode(GithubApiResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.github = githubResponse
                    }
                } catch {
                    ErrorMsg.jsonDecoding.log()
                    error.localizedDescription.logError()
                }
            }
        }.resume()
    }
}

