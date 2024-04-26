//
//  HomeView.swift
//  iDev
//
//  Created by Bek Roz on 9.04.2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var vm = ServicesVM.shared
    @State private var summarySelection = 0
    @State private var selectedImageIndex = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: sectionHeader("\(sectionHeaderTitle) summary")) {
                    AutoScroller(imageNames: ["github", "github"])
                }
                
                Button(action: vm.authorizeWakatime){
                    Text("Wakatime")
                }
            }
            .navigationTitle("Welcome, iDev!")
        }
    }
}

extension HomeView {
    private func sectionHeader(_ title: String) -> some View {
        return HStack {
            Text(title.capitalized)
                .font(.title3)
                .textCase(nil)
            Spacer()
            Picker("Summary", selection: $summarySelection) {
                Text("Daily").tag(0)
                Text("Weekly").tag(1)
                Text("Monthly").tag(2)
            }
            .textCase(nil)
        }
    }
    
    private var sectionHeaderTitle: String {
        switch summarySelection {
        case 0:
            return "Daily"
        case 1:
            return "Weekly"
        case 2:
            return "Monthly"
        default:
            return "Daily"
        }
    }
}

struct AutoScroller: View {
    var imageNames: [String]
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    
    // Step 3: Manage Selected Image Index
    @State private var selectedImageIndex: Int = 0

    var body: some View {
        TabView(selection: $selectedImageIndex) {
            // Step 6: Iterate Through Images
            ForEach(0..<imageNames.count, id: \.self) { index in
                VStack {
                    Text("Some infographics")
                    Spacer()
                    Text("Wakatime insights")
                }
            }
            
        }
        .frame(height: 150) // Step 10: Set Carousel Height
        .tabViewStyle(.page)
    }
}

struct StoryCard: View {
    var img: String
    
    var body: some View {
        Image(img)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 200)
            .cornerRadius(10)
    }
}


#Preview {
    HomeView()
}
