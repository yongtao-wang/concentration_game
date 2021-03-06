//
//  ConcentrationCards.swift
//  Concentration
//
//  Created by Yongtao Wang on 5/28/18.
//  Copyright © 2018 Yongtao. All rights reserved.
//

import Foundation

class Concentration{
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]   // assiged struct is copied. two card are different objects with same value
        }
        cards.shuffle()
    }
    
    private(set) var cards = [Card]()
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(\(index)): chosen index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            }
            else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        
    }
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
}

extension Array {
    /** randomize the order of an array's elements */
    mutating func shuffle() {
        for _ in 0..<10 {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}

extension Collection {
    /** return index of the 'one and only' element, return nil if not found */
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
