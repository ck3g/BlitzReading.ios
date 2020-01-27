//
//  SettingsView.swift
//  BlitzReading
//
//  Created by Vitali Tatarintev on 27.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
  var body: some View {
    NavigationView {
      List {
        NavigationLink(destination: Text("Language selection view")) {
          Text("Language")
        }

        NavigationLink(destination: Text("About the app")) {
          Text("About")
        }
      }
      .navigationBarTitle(Text("Settings"))
    }
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}
