//
//  PracticeParams.swift
//  BlitzReading
//
//  Created by Vitali Tatarintev on 24.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

class PracticeParams: ObservableObject {
  var practiceStarted = false
  var showResults = false
  var locale = "en"
  var durationInSeconds = 60
  var wordsPracticed = 0

  let words: [String]

  init() {
    self.words = Bundle.main.decode("words.\(self.locale).json")
  }

  func startPractice() {
    startPractice(duration: self.durationInSeconds)
  }

  func startPractice(duration: Int) {
    objectWillChange.send()

    self.durationInSeconds = duration
    self.showResults = false
    self.practiceStarted = true
  }

  func finishPractice(wordsPracticed: Int) {
    objectWillChange.send()

    self.showResults = true
    self.wordsPracticed = wordsPracticed
    self.practiceStarted = false
  }

  func selectPractice() {
    objectWillChange.send()

    self.showResults = false
  }
}
