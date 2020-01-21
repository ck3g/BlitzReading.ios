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

  var body: some View {
    Text("Practice started: \(durationInSeconds) seconds")
  }
}

struct PracticeView_Previews: PreviewProvider {
  static var previews: some View {
    PracticeView(durationInSeconds: 5)
  }
}
