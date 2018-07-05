//
//  CardTableViewCell.swift
//  MTG-Trading
//
//  Created by Daniel Huber on 7/4/18.
//  Copyright © 2018 Daniel Huber. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {

    @IBOutlet var cardNameLabel: UILabel!
    @IBOutlet var cardTypeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
