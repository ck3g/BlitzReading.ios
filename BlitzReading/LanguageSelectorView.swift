//
//  LanguageSelectorView.swift
//  BlitzReading
//
//  Created by Vitali Tatarintev on 28.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct LanguageSelectorView: View {
  @Environment(\.presentationMode) var presentationMode
  @State var selectedLocale: String

  let locales = ["en", "de"]
  let localesData = [
    "en": ["name": "English"],
    "de": ["name": "Deutsch"]
  ]
  
  var body: some View {
    NavigationView {
      Form {
        List {
          ForEach(self.locales, id: \.self) { locale in
            HStack {
              Text(self.localeName(locale: locale))
              Spacer()
              Image(systemName: locale == self.selectedLocale ? "largecircle.fill.circle" : "circle")
                .foregroundColor(.green)
            }
            .onTapGesture {
              self.selectedLocale = locale
            }
          }
        }
      }
      .navigationBarTitle("Language", displayMode: .inline)
      .navigationBarItems(
        leading: Button(action: {
          self.presentationMode.wrappedValue.dismiss()
        }) {
          Image(systemName: "xmark")
        },
        trailing: Button(action: {
          // save
          self.presentationMode.wrappedValue.dismiss()
        }) {
          Text("Save")
      })
    }
  }

  func localeName(locale: String) -> String {
    self.localesData[locale]?["name"] ?? "English"
  }
}

struct LanguageSelectorView_Previews: PreviewProvider {
  static var previews: some View {
    LanguageSelectorView(selectedLocale: "en")
  }
}
