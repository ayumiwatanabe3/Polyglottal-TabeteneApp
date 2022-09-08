//
//  TabeteneAppApp.swift
//  TabeteneApp
//
//  Created by 渡辺あゆみ on 2022/09/08.
//

import SwiftUI

@main
struct TabeteneAppApp: App {
    @ObservedObject  var foodsData = Foods()

    var body: some Scene {
        WindowGroup {
            ContentView(foods: foodsData.foods)
        }
    }
}
