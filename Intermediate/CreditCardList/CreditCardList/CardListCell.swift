//
//  CardListCell.swift
//  CreditCardList
//
//  Created by 이준복 on 2022/03/13.
//

import UIKit

class CardListCell: UITableViewCell {


    
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var promotionLabel: UILabel!
    @IBOutlet weak var cardNameLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
