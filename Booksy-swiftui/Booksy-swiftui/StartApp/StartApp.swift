//
//  StartApp.swift
//  Booksy-swiftui
//
//  Created by Tomek Rybkowski on 18/12/2021.
//
//

import SwiftUI

@main
struct StartApp: App {
  var body: some Scene {
    WindowGroup {
                
      MainView(viewModel: MainViewModel())
    }
  }
}
