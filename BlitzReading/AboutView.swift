//
//  AboutView.swift
//  BlitzReading
//
//  Created by Vitali Tatarintev on 30.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct AboutView: View {
  var body: some View {
    NavigationView {
      ScrollView {
        VStack(alignment: .leading) {
          Group {
            Text("When children make the first steps in reading, one of the techniques they can acquire is to learn how to read sight words. Those are commonly used words that a reader can memorize and recognize as a whole without the need to split words into syllables.")
          }
          .padding()

          Group {
            Text("How it works").font(.title)

            Text("The kid can pick a practice duration from the screen, which is starting a practice session. During that time, the child supposed to read (out loud) a suggested word and move to the next one until the time runs out.")
            Text("An adult can supervise the practice process to help the kid to read words properly, although that is not required.")
            Text("With enough practice, a young reader will be able to read those words faster. I would recommend practicing every day. With the small practice sessions (30 seconds, 60 seconds), you can do it almost everywhere. When you are waiting in the line, or commute, before bedtime. You choose.")
            Text("At the time you think your child reads fast and clear enough, then the goal of the app is accomplished.")
            Text("The kids can use the app to practice sight word reading for their second language as well. Although at the moment only English and German languages are supported.")
          }
          .padding()

          Group {
            Text("Ads").font(.title)

            Text("The app does not use any advertisement features and never will. I think that kids shouldn't be distracted during the practice and learning process. They should only focus on the process.")
          }
          .padding()

          Group {
            Text("How to help").font(.title)

            Text("You can help the app by reporting bugs, typos, improve this description, or helping introduce new languages. You can contact me on Twitter or create an issue on GitHub page of the project.")
          }
          .padding()

          Group{
            HStack {
              Image("twitter-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
              Button("@ck3g", action: {
                UIApplication.shared.open(URL(string: "https://twitter.com/ck3g")!)
              })
            }
            HStack {
              Image("github-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
              Button("BlitzReading.ios", action: {
                UIApplication.shared.open(URL(string: "https://github.com/ck3g/BlitzReading.ios")!)
              })
            }
          }
          .padding([.leading, .trailing])
          .padding(.bottom, 10)

          Spacer()
        }
        .padding(.top, -80) // removes the gap above the text
      }
    }
    .navigationBarTitle("About", displayMode: .inline)
  }
}

struct AboutView_Previews: PreviewProvider {
  static var previews: some View {
    AboutView()
  }
}
