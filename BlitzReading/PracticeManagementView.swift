//
//  PracticeManagementView.swift
//  BlitzReading
//
//  Created by Vitali Tatarintev on 23.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct PracticeManagementView: View {
  @EnvironmentObject var practiceParams: PracticeParams

  var body: some View {
    VStack {
      if practiceParams.practiceStarted {
        PracticeView()
      } else {
        if practiceParams.showResults {
          PracticeResultsView()
        } else {
          PracticeSelectionView()
        }
      }
    }
  }
}

struct PracticeManagementView_Previews: PreviewProvider {
  static var previews: some View {
    PracticeManagementView()
  }
}
