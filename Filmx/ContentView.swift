//
//  ContentView.swift
//  Filmx
//
//  Created by Oleksandr Kurinnyi on 09/04/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView { MovieHomeView() }
                .tabItem { Label("Home", systemImage: "film") }
                .tag(0)
            
            NavigationView { MovieSearchView() }
                .tabItem { Label("Search", systemImage: "magnifyingglass") }
                .tag(1)
        }
    }
}
