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
  @State private var showingLanguageSelector = false

  let locales = ["en", "de"]
  let localesData = [
    "en": ["name": "English"],
    "de": ["name": "Deutsch"]
  ]

  var selectedLanguage: String {
    self.localesData[self.locale]!["name"]!
  }

  var body: some View {
    NavigationView {
      Form {
        List {
          Button(action: { self.showingLanguageSelector = true }) {
            HStack {
              Text("Language")
                .foregroundColor(.primary)
              Spacer()
              Text(self.selectedLanguage)
                .foregroundColor(.secondary)
            }
          }

          NavigationLink(destination: Text("About the app")) {
            Text("About")
          }
        }
      }
      .navigationBarTitle(Text("Settings"), displayMode: .inline)
      .sheet(isPresented: $showingLanguageSelector) {
        LanguageSelectorView(selectedLocale: self.locale)
      }
    }
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}
