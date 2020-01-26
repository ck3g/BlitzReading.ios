//
//  Score.swift
//  BlitzReading
//
//  Created by Vitali Tatarintev on 26.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct Score: Identifiable, Codable {
  let id = UUID()
  let practiceDuration: Int
  let practicedWords: Int
  let createdAt = Date()

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

  private var locale: String
  private var saveKey: String

  init() {
    self.locale = "en"
    self.saveKey = "highscores-\(locale)"

    let filename = Self.getDocumentsDirectory().appendingPathComponent(self.saveKey)

    do {
      let data = try Data(contentsOf: filename)
      self.scores = try JSONDecoder().decode([Score].self, from: data)
      return
    } catch {
      print("Unable to load saved highscores.")
    }

    self.scores = []
  }

  func add(duration: Int, words: Int) {
    self.objectWillChange.send()
    let score = Score(practiceDuration: duration, practicedWords: words)
    self.scores.append(score)
    save()
  }

  private static func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
  }

  private func save() {
    do {
      let filename = Self.getDocumentsDirectory().appendingPathComponent(self.saveKey)
      let data = try JSONEncoder().encode(self.scores)
      try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
    } catch {
      print("Unable to save highscores.")
    }
  }
}
