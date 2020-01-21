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
  let onFinish: () -> Void

  let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

  @State private var timeRemaining = 0
  @State private var isActive = true

  var body: some View {
    VStack {
      Text("Practice started: \(durationInSeconds) seconds")
      Text("Time left: \(timeRemaining)")
    }
    .onReceive(timer) { time in
      guard self.isActive else { return }

      if self.timeRemaining == 0 {
        self.onFinish()
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
      self.timeRemaining = self.durationInSeconds
    })
  }
}

struct PracticeView_Previews: PreviewProvider {
  static var previews: some View {
    PracticeView(durationInSeconds: 5, onFinish: {})
  }
}
