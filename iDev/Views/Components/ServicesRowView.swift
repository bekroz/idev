//
//  ServicesRowView.swift
//  iDev
//
//  Created by Bek Roz on 13.04.2024.
//

import SwiftUI

struct ServicesRowView: View {
    let service: Service
    
    var body: some View {
        HStack {
            Image(service.name)
                .resizable()
                .frame(width: 40)
                .frame(height: 40)
            Text(service.name.capitalized)
                .font(.title3)
            Spacer()
        }
    }
}


#Preview {
    ServicesRowView(service:
        Service(name: "github")
    )
}
