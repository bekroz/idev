//
//  AddServicesListView.swift
//  iDev
//
//  Created by Bek Roz on 13.04.2024.
//

import SwiftUI

struct AddServicesListView: View {
    var body: some View {
        NavigationView {
            Form {
                Button {
                    print("hello")
                } label: {
                    ServicesRowView(service: Service(name: "github"))
                        .buttonStyle(.plain)
                }
            }
            .navigationTitle("Add new service")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AddServicesListView()
}
