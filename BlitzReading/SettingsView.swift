//
//  SettingsView.swift
//  BlitzReading
//
//  Created by Vitali Tatarintev on 27.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
  @EnvironmentObject var language: Language

  @State private var showingLanguageSelector = false

  var body: some View {
    NavigationView {
      Form {
        List {
          Button(action: { self.showingLanguageSelector = true }) {
            HStack {
              Text("Language")
                .foregroundColor(.primary)
              Spacer()
              Text(self.language.current)
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
        LanguageSelectorView(selectedLocale: self.language.locale)
          .environmentObject(self.language)
      }
    }
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}
