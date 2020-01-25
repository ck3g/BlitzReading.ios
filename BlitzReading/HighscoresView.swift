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

struct HighscoresHeader: View {
  let screenHeight: CGFloat

  var body: some View {
    Group {
      Image(systemName: "rosette")
        .resizable()
        .scaledToFit()
        .frame(width: 70)
        .foregroundColor(.yellow)
        .padding(.top, screenHeight * 0.05)
        .padding(.bottom)

      Text("Highscores")
        .font(.largeTitle)
        .padding(.bottom, screenHeight * 0.1)
    }
  }
}

struct HighscoresView: View {
  @Environment(\.horizontalSizeClass) var sizeClass

  @State private var highscores: [Score] = []

  let durations = [5, 30, 60]

  var rankedHighscores: [Int: [Score]] {
    [
      5: self.highscores.filter({ $0.practiceDuration == 5 }).sorted(by: { $0.practicedWords > $1.practicedWords }),
      30: self.highscores.filter({ $0.practiceDuration == 30 }).sorted(by: { $0.practicedWords > $1.practicedWords }),
      60: self.highscores.filter({ $0.practiceDuration == 60 }).sorted(by: { $0.practicedWords > $1.practicedWords }),
    ]
  }

  var longestListCount: Int {
    self.rankedHighscores.max(by: { $0.value.count < $1.value.count })?.value.count ?? 0
  }

  var body: some View {
   GeometryReader { geometry in
      VStack {
        HStack {
          if self.sizeClass == .compact {
            VStack { HighscoresHeader(screenHeight: geometry.size.height) }
          } else {
            HStack { HighscoresHeader(screenHeight: geometry.size.height) }
          }
        }


        HStack(alignment: .top) {
          VStack(alignment: .leading) {
            Group {
              Text(" ")
              Text("#")
                .bold()
            }
            .font(.subheadline)

            Divider()

            ForEach(0..<self.longestListCount, id: \.self) { index in
              Text("\(index + 1).")
                .bold()
                .padding(.bottom, 10)
            }
          }

          ForEach(self.durations, id: \.self) { duration in
            Group {
              Spacer()

              VStack {
                Group {
                  Text("words").bold()
                  Text("per \(duration) sec").bold()
                }
                .font(.subheadline)
                Divider()

                ForEach(self.rankedHighscores[duration] ?? []) { highscore in
                  Text("\(highscore.practicedWords)")
                    .foregroundColor(.secondary)
                    .padding(.bottom, 10)
                }
              }
            }
          }
        }
        .frame(width: geometry.size.width * 0.9)

        Spacer()
      }.onAppear(perform: {
        self.highscores = Score.example
      })
    }
  }
}

struct HighscoresView_Previews: PreviewProvider {
  static var previews: some View {
    HighscoresView()
  }
}
