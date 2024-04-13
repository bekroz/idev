//
//  ServicesView.swift
//  iDev
//
//  Created by Bek Roz on 9.04.2024.
//

import SwiftUI

struct ServicesView: View {
    
    let services = [
        "Github",
        "Gitlab",
        "Bitbucket",
        "Vercel",
        "Cloudflare"
    ]
    
    @State var query = ""
    
    var body: some View {
        NavigationStack {
            Form {
                
                List(services, id: \.self) { service in
                    NavigationLink {
                        Text(service)
                            .navigationTitle(service)
                            .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        ServicesRowView(service: service)
                    }
                }
                
            }
            .navigationTitle("Services")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "plus.app.fill")
                        .resizable()
                        .frame(width: 20)
                        .frame(height: 20)
                        .foregroundColor(Color.primary)
                }
            }
        }
        .searchable(text: $query)
    }
}

#Preview {
    ServicesView()
}

struct ServicesRowView: View {
    let service: String
    
    var body: some View {
        HStack {
            Image("github")
                .resizable()
                .frame(width: 40)
                .frame(height: 40)
            Text(service)
                .font(.title3)
            Spacer()
            
            Text("24 Issues")
            
            
            Image(systemName: "link.circle.fill")
                .foregroundColor(Color.blue)
                .rotationEffect(.degrees(45))
            
        }
    }
}
