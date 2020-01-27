//
//  SettingsView.swift
//  BlitzReading
//
//  Created by Vitali Tatarintev on 27.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
  @State private var locale = "en"

  let locales = ["en", "de"]
  let localesData = [
    "en": ["name": "English"],
    "de": ["name": "Deutsch"]
  ]

  var body: some View {
    NavigationView {
      Form {
        List {
          Picker("Language", selection: $locale) {
            ForEach(self.localesData.keys, id: \.self) {
              Text(self.localesData[$0]!["name"]!)
            }
          }

          NavigationLink(destination: Text("About the app")) {
            Text("About")
          }
        }
      }
      .navigationBarTitle(Text("Settings"), displayMode: .inline)
    }
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}
