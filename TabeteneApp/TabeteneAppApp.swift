//
//  TabeteneAppApp.swift
//  TabeteneApp
//
//  Created by 渡辺あゆみ on 2022/09/08.
//

import SwiftUI

@main
struct TabeteneAppApp: App {
    @StateObject  var foodsClass = Foods()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(foodsClass)
        }
    }
}
