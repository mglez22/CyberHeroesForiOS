//
//  MarcadorTableViewCell.swift
//  CyberHeroe
//
//  Created by Mario on 28/04/2018.
//  Copyright © 2018 Mario. All rights reserved.
//

import UIKit

class MarcadorTableViewCell: UITableViewCell {

    @IBOutlet weak var intentos: UILabel!
    @IBOutlet weak var timer: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
