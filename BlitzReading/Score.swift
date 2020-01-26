//
//  Score.swift
//  BlitzReading
//
//  Created by Vitali Tatarintev on 26.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct Score: Identifiable {
  let id = UUID()
  let practiceDuration: Int
  let practicedWords: Int
  let scoredAt = Date()

  static var example: [Score] = [
    Score(practiceDuration: 5, practicedWords: 5),
    Score(practiceDuration: 5, practicedWords: 7),
    Score(practiceDuration: 5, practicedWords: 3),
    Score(practiceDuration: 30, practicedWords: 27),
    Score(practiceDuration: 30, practicedWords: 20),
    Score(practiceDuration: 30, practicedWords: 35),
    Score(practiceDuration: 30, practicedWords: 10),
    Score(practiceDuration: 60, practicedWords: 60),
    Score(practiceDuration: 60, practicedWords: 80)
  ]
}

class Highscores: ObservableObject {
  var scores: [Score]

  init() {
    self.scores = []
  }

  func add(duration: Int, words: Int) {
    self.objectWillChange.send()
    let score = Score(practiceDuration: duration, practicedWords: words)
    self.scores.append(score)
  }
}
