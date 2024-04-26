//
//  ServicesView.swift
//  iDev
//
//  Created by Bek Roz on 9.04.2024.
//

import SwiftUI

struct ServicesView: View {
    @State var query = ""
    @State var showAddServicesList = false
    @ObservedObject var vm = ServicesVM.shared
    
    var body: some View {
        NavigationStack {
            Form {
                List(vm.data, id: \.name) { service in
                    NavigationLink {
                        Text(service.name)
                            .navigationTitle(service.name)
                            .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        ServicesRowView(service: service)
                    }
                }
            }
            .navigationTitle("Services")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddServicesList.toggle()
                    } label: {
                        Image(systemName: "plus.app.fill")
                            .resizable()
                            .frame(width: 20)
                            .frame(height: 20)
                            .foregroundColor(Color.primary)
                    }
                }
            }
        }
        .searchable(text: $query)
        .sheet(isPresented: $showAddServicesList) {
            AddServicesListView()
        }
    }
}

#Preview {
    ServicesView()
}
