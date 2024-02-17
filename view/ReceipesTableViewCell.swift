//
//  ReceipesTableViewCell.swift
//  machineTest_Ios
//
//  Created by STC on 17/02/24.
//

import UIKit

class ReceipesTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var receipesImage: UIImageView!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    
    @IBOutlet weak var reviewCount: UILabel!
    
    @IBOutlet weak var TagLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
