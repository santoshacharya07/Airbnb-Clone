//
//  MainTabView.swift
//  Airbnb Clone
//
//  Created by Santosh Acharya on 12/01/2024.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            ExploreView()
                .tabItem { Label("Explore", systemImage: "magnifyingglass") }
            WishListView()
                .tabItem { Label("Explore", systemImage: "heart") }
            ProfileView()
                .tabItem { Label("Explore", systemImage: "person") }
        }
    }
}

#Preview {
    MainTabView()
}
