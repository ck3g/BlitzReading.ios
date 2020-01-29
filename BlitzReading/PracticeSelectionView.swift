//
//  PracticeSelectionView.swift
//  BlitzReading
//
//  Created by Vitali Tatarintev on 21.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI


struct PracticeButton: View {
  let text: String
  let action: () -> Void

  var body: some View {
    Button(action: self.action) {
      Text(self.text)
    }
    .padding()
    .frame(width: 250)
    .foregroundColor(.blue)
    .background(Color.white)
    .overlay(
      RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2)
    )
    .padding(10)
  }
}

struct PracticeSelectionView: View {
  @EnvironmentObject var practiceParams: PracticeParams
  @EnvironmentObject var language: Language

  var body: some View {
    VStack {
      Text("Practice \(self.language.current) words")
        .font(.headline)
        .padding()

      PracticeButton(text: "for 5 seconds", action: {
        self.practiceParams.startPractice(duration: 5)
      })

      PracticeButton(text: "for 30 seconds", action: {
        self.practiceParams.startPractice(duration: 30)
      })

      PracticeButton(text: "for 60 seconds", action: {
        self.practiceParams.startPractice(duration: 60)
      })
    }
  }
}

struct PracticeSelectionView_Previews: PreviewProvider {
  static var previews: some View {
    PracticeSelectionView()
  }
}
