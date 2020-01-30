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
  @EnvironmentObject var language: Language

  @State var selectedLocale: String
  
  var body: some View {
    NavigationView {
      Form {
        List {
          ForEach(self.language.locales, id: \.self) { locale in
            HStack {
              Text(self.language.nameFor(locale: locale))
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
      .navigationBarTitle("Practice language", displayMode: .inline)
      .navigationBarItems(
        leading: Button(action: {
          self.presentationMode.wrappedValue.dismiss()
        }) {
          Image(systemName: "xmark")
        },
        trailing: Button(action: {
          self.language.setLocale(locale: self.selectedLocale)
          self.presentationMode.wrappedValue.dismiss()
        }) {
          Text("Save")
      })
    }
  }
}

struct LanguageSelectorView_Previews: PreviewProvider {
  static var previews: some View {
    LanguageSelectorView(selectedLocale: "de")
  }
}
