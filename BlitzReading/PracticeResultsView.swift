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
  let onHome: () -> Void
  let onRetry: () -> Void

  var body: some View {
    VStack {
      Text("Well done!")
        .font(.largeTitle)

      HStack {
        ResultButton(action: self.onHome, imageName: "house.fill")
        ResultButton(action: self.onRetry, imageName: "arrow.clockwise")
      }
    }
  }
}

struct PracticeResultsView_Previews: PreviewProvider {
  static var previews: some View {
    PracticeResultsView(onHome: {}, onRetry: {})
  }
}
