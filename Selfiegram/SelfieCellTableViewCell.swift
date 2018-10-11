//
//  SelfieCellTableViewCell.swift
//  Selfiegram
//
//  Created by Jacqueline Chen on 2018-10-10.
//  Copyright © 2018 Jacqueline Chen. All rights reserved.
//

import UIKit

class SelfieCellTableViewCell: UITableViewCell {

    @IBOutlet weak var selfieImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
