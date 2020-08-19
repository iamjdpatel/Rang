//
//  TabBar.swift
//  Rang
//
//  Created by JD Patel on 26/11/19.
//  Copyright © 2019 JD. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "eyedropper")
                    Text("Rang")
                }.tag(0)
            GradientView()
                .tabItem {
                    Image(systemName: "circle.lefthalf.fill")
                    Text("Gradients")
                }.tag(1)
        }
    }
}

