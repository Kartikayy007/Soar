//
//  MainTabView.swift
//  Soar
//
//  Created by kartikay on 13/10/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        
        TabView {
            Flights()
                .tabItem {
                    Label("Flights", systemImage: "airplane")
                }
            
        }.tint(.primary)
    }
}

#Preview {
    MainTabView()
}
