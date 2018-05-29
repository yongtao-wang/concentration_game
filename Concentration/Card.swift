//
//  Card.swift
//  Concentration
//
//  Created by Yongtao Wang on 5/28/18.
//  Copyright © 2018 Yongtao. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    fileprivate static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
