//
//  ContentView.swift
//  BlitzReading
//
//  Created by Vitali Tatarintev on 20.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      PracticeManagementView()
        .tabItem {
          Image(systemName: "book")
          Text("Practice")
        }

      Text("Highscores")
        .tabItem {
          Image(systemName: "rosette")
          Text("Highscores")
        }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
