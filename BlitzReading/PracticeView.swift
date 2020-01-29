//
//  PracticeView.swift
//  BlitzReading
//
//  Created by Vitali Tatarintev on 21.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct PracticeView: View {
  @EnvironmentObject var practiceParams: PracticeParams
  @EnvironmentObject var highscores: Highscores
  @EnvironmentObject var language: Language

  let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

  @State private var timeRemaining = 0
  @State private var wordsPracticed = 0
  @State private var isActive = true
  @State private var currentWord = ""
  @State private var remainingWords: [String] = []

  var body: some View {
    ZStack {
      VStack {
        HStack {
          Spacer()
          Text("\(timeRemaining)")
            .font(.caption)
            .padding()
        }
        Spacer()
      }

      Text(self.currentWord)
        .font(.system(size: 90))

      VStack {
        Spacer()
        HStack {
          Spacer()
          Button(action: {
            self.currentWord = self.getNextWord()
            self.wordsPracticed += 1
          }) {
            Image(systemName: "arrow.right.circle")
              .resizable()
              .frame(width: 60, height: 60)
          }
          .padding()
          .disabled(self.timeRemaining == 0)
        }
      }
    }
    .onReceive(timer) { time in
      guard self.isActive else { return }

      if self.timeRemaining == 0 {
        self.practiceParams.finishPractice(wordsPracticed: self.wordsPracticed)
        self.highscores.add(locale: self.language.locale, duration: self.practiceParams.durationInSeconds, words: self.wordsPracticed)
      }

      self.timeRemaining -= 1
    }
    .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
      self.isActive = false
    }
    .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
      self.isActive = true
    }
    .onAppear(perform: {
      self.timeRemaining = self.practiceParams.durationInSeconds
      self.remainingWords = self.practiceParams.words(locale: self.language.locale).shuffled()
      self.currentWord = self.getNextWord()
    })
  }

  func getNextWord() -> String {
    self.remainingWords.removeFirst()
  }
}

struct PracticeView_Previews: PreviewProvider {
  static var previews: some View {
    PracticeView()
  }
}
