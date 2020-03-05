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
    .foregroundColor(.accentColor)
    .background(Color(UIColor.systemBackground))
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

      ForEach(PracticeParams.durations, id: \.self) { duration in
        PracticeButton(text: "for \(duration) seconds", action: {
          self.practiceParams.startPractice(duration: duration)
        })
      }
    }
  }
}

struct PracticeSelectionView_Previews: PreviewProvider {
  static var previews: some View {
    PracticeSelectionView()
  }
}
