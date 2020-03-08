//
//  CreditsView.swift
//  BlitzReading
//
//  Created by Vitali Tatarintev on 26.02.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct UrlButton: View {
  let urlString: String

  var body: some View {
    Button(urlString, action: {
      UIApplication.shared.open(URL(string: self.urlString)!)
    })
  }
}

struct Icon8Credit: View {
  let title: String
  let iconName: String

  var body: some View {
    Group {
      Text("\(title) icon by Icons 8")
        .font(.headline)
    }
  }
}

struct CreditsView: View {
  var body: some View {
    NavigationView {
      ScrollView {
        VStack(alignment: .leading) {
          Group {
            Text("Blitz Read")
              .font(.largeTitle)

            Text("Blitz Read uses some open source libraries and free icons listed below.")
          }
          .padding(.bottom)

          Group {
            Text("Icons")
              .font(.title)

            Icon8Credit(title: "Trophy", iconName: "trophy")
          }
          .padding(.bottom, 10)
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
