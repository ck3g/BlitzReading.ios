//
//  PracticeResultsView.swift
//  BlitzReading
//
//  Created by Vitali Tatarintev on 22.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct ResultButton: View {
  let action: () -> Void
  let imageName: String

  var body: some View {
    Button(action: self.action) {
      Image(systemName: self.imageName)
        .resizable()
        .scaledToFit()
    }
    .padding()
    .frame(width: 80, height: 80)
    .padding()
  }
}

struct PracticeResultsView: View {
  let wordsPracticed: Int
  let practiceDuration: Int
  let onHome: () -> Void
  let onRetry: () -> Void

  var body: some View {
    VStack {
      Image(systemName: "star.fill")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
        .foregroundColor(.yellow)

      Text("Well done!")
        .bold()
        .font(.largeTitle)
        .padding(.bottom)

      Group {
        Text("You have completed") +
        Text(" \(self.practiceDuration) ").bold() +
        Text("seconds practice.")
      }

      Group {
        Text("Your score:") +
        Text(" \(self.wordsPracticed) ").bold()
      }
      .padding()

      HStack {
        ResultButton(action: self.onHome, imageName: "book")
        ResultButton(action: self.onRetry, imageName: "arrow.clockwise")
      }
    }
  }
}

struct PracticeResultsView_Previews: PreviewProvider {
  static var previews: some View {
    PracticeResultsView(wordsPracticed: 10, practiceDuration: 5, onHome: {}, onRetry: {})
  }
}
