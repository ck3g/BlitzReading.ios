//
//  ContentView.swift
//  BlitzReading
//
//  Created by Vitali Tatarintev on 20.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State private var locale = "en"
  @State private var words: [String] = []

  var body: some View {
    VStack {
      Text("Words: \(words.count)")
    }
    .onAppear(perform: {
      self.words = Bundle.main.decode("words.\(self.locale).json")
    })
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
