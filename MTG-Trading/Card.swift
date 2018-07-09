//
//  Card.swift
//  MTG-Trading
//
//  Created by Daniel Huber on 7/7/18.
//  Copyright © 2018 Daniel Huber. All rights reserved.
//

import UIKit

class Card {

    var name: String
    var artUrl: String
    var manaCost: String?
    var cmc: Int
    var types: String
    var text: String?
    var flavorText: String?
    
    init(name: String, artUrl: String, manaCost: String?, types: String, text: String?, flavorText: String?) {
        self.name = name
        self.artUrl = artUrl
        self.manaCost = manaCost
        self.cmc = 0
        self.types = types
        self.flavorText = flavorText
    }
    
    func getCmc() {
        self.cmc = 1
    }
}
