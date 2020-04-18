//
//  Settings.swift
//  SwiftUI-UserDefults-Demo
//
//  Created by Patrick Mifsud on 15/12/19.
//  Copyright © 2019 Patrick Mifsud. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

final class UserSettings: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    
    @UserDefault("showDescription", defaultValue: true)
    var showDescriptionValue: Bool
    
    @UserDefault("imageSizeOptions", defaultValue: 1)
    var imageSizeId: Int
    let imageSizes = [ImageSizeSetting(id: 0, name: "x1", scale: 1), ImageSizeSetting(id: 1, name: "x2", scale: 2), ImageSizeSetting(id: 2, name: "x3", scale: 3), ImageSizeSetting(id: 3, name: "x4", scale: 4),ImageSizeSetting(id: 4, name: "x5", scale: 5)]
    
    @UserDefault("TitleColorOptions", defaultValue: 0)
    var titleColorId: Int
    let titleColors = [ColorSetting(id: 0, name: "Orange", color: .orange), ColorSetting(id: 1, name: "Red", color: .red), ColorSetting(id: 2, name: "Yellow", color: .yellow), ColorSetting(id: 3, name: "Blue", color: .blue)]
    
    
    private var notificationSubscription: AnyCancellable?
    init() {
        notificationSubscription = NotificationCenter.default.publisher(for: UserDefaults.didChangeNotification).sink { _ in
            self.objectWillChange.send()
        }
    }
}

struct ColorSetting:Identifiable {
    var id: Int
    var name: String
    var color: Color
}

struct ImageSizeSetting:Identifiable {
    var id: Int
    var name: String
    var scale: CGFloat
}
