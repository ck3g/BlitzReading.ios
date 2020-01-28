//
//  Language.swift
//  BlitzReading
//
//  Created by Vitali Tatarintev on 28.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

class Language: ObservableObject {
  var locale: String

  private let saveKey = "UserLocale"

  let locales = ["en", "de"]
  let availableLanguages = [
    "en": ["name": "English"],
    "de": ["name": "Deutsch"]
  ]

  var current: String {
    self.nameFor(locale: self.locale)
  }

  init() {
    if let locale = UserDefaults.standard.string(forKey: saveKey) {
      self.locale = locale
      return
    }

    self.locale = "en"
  }

  func setLocale(locale: String) {
    self.objectWillChange.send()
    self.locale = locale
    save()
  }

  func nameFor(locale: String) -> String {
    self.availableLanguages[locale]?["name"] ?? "English"
  }

  private func save() {
    UserDefaults.standard.set(self.locale, forKey: saveKey)
  }
}
