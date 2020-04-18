//
//  ContentView.swift
//  SwiftUI-UserDefults-Demo
//
//  Created by Patrick Mifsud on 17/4/20.
//  Copyright © 2020 Patrick Mifsud. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView() {
            PreviewView()
                .tabItem {
                    VStack {
                        Image(systemName: "house.fill")
                            .imageScale(.large)
                        Text("Home")
                    }
                }
            
            SettingsView()
                .tabItem {
                    VStack {
                        Image(systemName: "gear")
                            .imageScale(.large)
                        Text("Settings")
                    }
                }
        }
    }
}

struct PreviewView: View {
    @ObservedObject var settings = UserSettings()

    var body: some View {
        VStack {
            VStack {
                Text("👋🌏")
                    .font(.largeTitle)
                    .padding()
                Text("Hello, World!")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(settings.titleColors[settings.titleColorId].color)
            }
            if settings.showDescriptionValue {
                VStack(alignment: .center) {
                    Text("This is app demostrates UserDefualts with SwiftUI")
                        .multilineTextAlignment(.center)
                        .padding()
                }
            }
            Spacer()
            Image("circle")
                .scaleEffect(settings.imageSizes[settings.imageSizeId].scale)
            Spacer()
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
