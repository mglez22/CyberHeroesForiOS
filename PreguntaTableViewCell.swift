//
//  PreguntaTableViewCell.swift
//  CyberHeroe
//
//  Created by Mario on 28/04/2018.
//  Copyright © 2018 Mario. All rights reserved.
//

import UIKit

class PreguntaTableViewCell: UITableViewCell {

    
    @IBOutlet weak var pregunta: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
