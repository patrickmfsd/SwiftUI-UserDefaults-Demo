//
//  AppPreferencesView.swift
//  SwiftUI-UserDefults-Demo
//
//  Created by Patrick Mifsud on 6/12/19.
//  Copyright © 2019 Patrick Mifsud. All rights reserved.
//

import SwiftUI

// MARK: App Settings Main Menu
struct SettingsView: View {
    @ObservedObject var settings = UserSettings()
    @State var showingSettingScreen = false

    var body: some View {
        NavigationView {
            List {
                Section {
                    HStack {
                        Text("Image Size")
                        Spacer(minLength: 25)
                        Picker("Image Scale", selection: self.$settings.imageSizeId) {
                            ForEach(self.settings.imageSizes) { imageSize in
                                Text(imageSize.name).tag(self.settings.imageSizeId)
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                    Toggle("Show Description", isOn: $settings.showDescriptionValue)
                }
                Section(header: Text("Colors")) {
                    Picker("Title Text Color", selection: self.$settings.titleColorId) {
                        ForEach(self.settings.titleColors) { tColors in
                            Text(tColors.name).tag(self.settings.titleColorId)
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
            .navigationBarTitle(Text("Settings"))
        }
    }
}

// MARK: Settings Main Menu Item
struct MainSettingItem: View {
    var label: String
    var icon: String
    var color: Color
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .imageScale(.medium)
                .frame(width: 30.0, height: /*@START_MENU_TOKEN@*/30.0/*@END_MENU_TOKEN@*/)
                .background(color)
                .foregroundColor(.white)
                .cornerRadius(10)
            Text(label)
        }
        .accessibility(label: Text(label))
    }
}

// MARK: App Details Footer Text
struct AppDetailsFooterText: View {
    let appVersionNumberLabel:String = ""

    let appName = "CFBundleName"
    let appVer = "CFBundleShortVersionString"
    let appBuild = "CFBundleVersion"
        
    var body: some View {
        Text(getVersionNumber())
    }
    
    func getVersionNumber() -> String {
        let dictionary = Bundle.main.infoDictionary!
        let name = dictionary[appName] as! String
        let version = dictionary[appVer] as! String
        let build = dictionary[appBuild] as! String

        return "\(name), \(version) (\(build))"
    }
}

struct AppPreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
