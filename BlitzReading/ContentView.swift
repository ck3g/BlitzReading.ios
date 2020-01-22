//
//  ContentView.swift
//  BlitzReading
//
//  Created by Vitali Tatarintev on 20.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State private var locale = "en"
  @State private var words: [String] = []
  @State private var practiceStarted = false
  @State private var practiceDurationInSeconds = 60
  @State private var showResults = false

  var body: some View {
    VStack {
      if practiceStarted {
        PracticeView(words: self.words, durationInSeconds: practiceDurationInSeconds, onFinish: finishPractice)
      } else {
        if showResults {
          PracticeResultsView(
            onHome: {
              self.showResults = false
            },
            onRetry: {
              self.startPractice(self.practiceDurationInSeconds)
            }
          )
        } else {
          PracticeSelectionView(locale: self.locale, onStart: startPractice)
        }
      }
    }
    .onAppear(perform: {
      self.words = Bundle.main.decode("words.\(self.locale).json")
    })
  }

  func startPractice(_ durationInSeconds: Int) {
    self.practiceDurationInSeconds = durationInSeconds
    self.practiceStarted = true
  }

  func finishPractice() {
    self.practiceStarted = false
    self.showResults = true
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
