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
  @EnvironmentObject var practiceParams: PracticeParams

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
          Text(" \(self.practiceParams.durationInSeconds) ").bold() +
          Text("seconds practice.")
      }

      Group {
        Text("Your score:") +
          Text(" \(self.practiceParams.wordsPracticed) ").bold()
      }
      .padding()

      HStack {
        ResultButton(action: {
          self.practiceParams.selectPractice()
        }, imageName: "book")
        ResultButton(action: {
          self.practiceParams.startPractice()
        }, imageName: "arrow.clockwise")
      }
    }
  }
}

struct PracticeResultsView_Previews: PreviewProvider {
  static var previews: some View {
    PracticeResultsView()
  }
}
