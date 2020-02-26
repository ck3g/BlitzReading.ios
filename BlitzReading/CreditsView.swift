//
//  CreditsView.swift
//  BlitzReading
//
//  Created by Vitali Tatarintev on 26.02.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct CreditsView: View {
  var body: some View {
    NavigationView {
      ScrollView {
        VStack(alignment: .leading) {
          Group {
            Text("BlitzReading")
              .font(.largeTitle)

            Text("BlitzReading was developed by Vitali Tatarintev. If you have any feedback or questions, you're welcome to tweet me @ck3g.")
          }
          .padding(.bottom)

          Group {
            Text("Icons")
              .font(.title)
              .padding(.bottom)


          }
        }
        .padding([.leading, .trailing], 7)
        .padding(.top, -80) // removes the gap above the text
      }
    }
    .navigationBarTitle("Credits", displayMode: .inline)
  }
}

struct CreditsView_Previews: PreviewProvider {
  static var previews: some View {
    CreditsView()
  }
}
