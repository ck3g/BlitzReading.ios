//
//  Word.swift
//  BlitzReading
//
//  Created by Vitali Tatarintev on 20.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import Foundation

struct Word: Codable {
  let value: String

  static var all: [String] = Bundle.main.decode("words.en.json")
}
