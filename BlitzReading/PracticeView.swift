//
//  PracticeView.swift
//  BlitzReading
//
//  Created by Vitali Tatarintev on 21.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct PracticeView: View {
  let durationInSeconds: Int

  let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

  @State private var timeRemaining = 0

  var body: some View {
    VStack {
      Text("Practice started: \(durationInSeconds) seconds")
      Text("Time left: \(timeRemaining)")
    }
    .onReceive(timer) { time in
      if self.timeRemaining > 0 {
        self.timeRemaining -= 1
      }
    }
    .onAppear(perform: {
      self.timeRemaining = self.durationInSeconds
    })
  }
}

struct PracticeView_Previews: PreviewProvider {
  static var previews: some View {
    PracticeView(durationInSeconds: 5)
  }
}
