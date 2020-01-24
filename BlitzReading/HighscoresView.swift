//
//  HighscoresView.swift
//  BlitzReading
//
//  Created by Vitali Tatarintev on 24.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct Score: Identifiable {
  let id = UUID()
  let practiceDuration: Int
  let practicedWords: Int

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

struct HighscoresView: View {
  @State private var highscores: [Score] = []
  @State private var duration = 5

  let durations = [5, 30, 60]

  var filteredHighscores: [Score] {
    self.highscores.filter({ $0.practiceDuration == self.duration })
  }

  var body: some View {
    VStack {
      Image(systemName: "rosette")
        .resizable()
        .scaledToFit()
        .frame(width: 70)
        .foregroundColor(.yellow)

      Picker("Duration", selection: $duration) {
        ForEach(durations, id: \.self) {
          Text("\($0) seconds")
        }
      }
      .pickerStyle(SegmentedPickerStyle())

      VStack(alignment: .leading) {
        ForEach(filteredHighscores) { score in
          HStack {
            Text("1")

            Text("\(score.practicedWords)")
          }
        }
      }
    }.onAppear(perform: {
      self.highscores = Score.example
    })
  }
}

struct HighscoresView_Previews: PreviewProvider {
  static var previews: some View {
    HighscoresView()
  }
}
