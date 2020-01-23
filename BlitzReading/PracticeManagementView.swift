//
//  PracticeManagementView.swift
//  BlitzReading
//
//  Created by Vitali Tatarintev on 23.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct PracticeManagementView: View {
  @State private var locale = "en"
  @State private var words: [String] = []
  @State private var practiceStarted = false
  @State private var practiceDurationInSeconds = 60
  @State private var showResults = false
  @State private var lastPracticeWordsCount = 0

  var body: some View {
    VStack {
      if practiceStarted {
        PracticeView(words: self.words, durationInSeconds: practiceDurationInSeconds, onFinish: finishPractice, onAbort: abortPractice)
      } else {
        if showResults {
          PracticeResultsView(
            wordsPracticed: self.lastPracticeWordsCount,
            practiceDuration: self.practiceDurationInSeconds,
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

  func finishPractice(_ wordsPracticed: Int) {
    self.lastPracticeWordsCount = wordsPracticed
    self.practiceStarted = false
    self.showResults = true
  }

  func abortPractice() {
    self.practiceStarted = false
    self.showResults = false
  }
}

struct PracticeManagementView_Previews: PreviewProvider {
  static var previews: some View {
    PracticeManagementView()
  }
}
