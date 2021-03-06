//
//  ContentView.swift
//  BlitzReading
//
//  Created by Vitali Tatarintev on 20.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var practiceParams = PracticeParams()
  @ObservedObject var highscores = Highscores()
  @ObservedObject var language = Language()

  let practiceManagementView = PracticeManagementView()

  var body: some View {
    Group {
      if self.practiceParams.practiceStarted {
        practiceManagementView
      } else {
        TabView {
          practiceManagementView
            .tabItem {
              Image(systemName: "book")
              Text("Practice")
            }

          HighscoresView()
            .tabItem {
              Image(systemName: "rosette")
              Text("Highscores")
            }

          SettingsView()
            .tabItem {
              Image(systemName: "slider.horizontal.3")
              Text("Settings")
            }
        }
      }
    }
    .environmentObject(self.practiceParams)
    .environmentObject(self.highscores)
    .environmentObject(self.language)
    .accentColor(.purple)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
