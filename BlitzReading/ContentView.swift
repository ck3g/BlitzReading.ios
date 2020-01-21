//
//  ContentView.swift
//  BlitzReading
//
//  Created by Vitali Tatarintev on 20.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct PracticeButton: View {
  let text: String
  let action: () -> Void

  var body: some View {
    Button(action: self.action) {
      Text(self.text)
    }
    .padding()
    .frame(width: 250)
    .foregroundColor(.blue)
    .background(Color.white)
    .overlay(
      RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2)
    )
    .padding(10)
  }
}

struct ContentView: View {
  @State private var locale = "en"
  @State private var words: [String] = []
  @State private var practiceStarted = false
  @State private var practiceDurationInSeconds = 60

  let locales = ["en": "English", "de": "German"]

  var body: some View {
    VStack {
      if practiceStarted {
        Text("Practice started: \(practiceDurationInSeconds) seconds")
      } else {
        Text("Practice \(locales[locale] ?? "English") words")
          .font(.headline)
          .padding()

        PracticeButton(text: "for 5 seconds", action: {
          self.practiceStarted = true
          self.practiceDurationInSeconds = 5
        })

        PracticeButton(text: "for 30 seconds", action: {
          self.practiceStarted = true
          self.practiceDurationInSeconds = 30
        })

        PracticeButton(text: "for 60 seconds", action: {
          self.practiceStarted = true
          self.practiceDurationInSeconds = 60
        })
      }
    }
    .onAppear(perform: {
      self.words = Bundle.main.decode("words.\(self.locale).json")
    })
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
