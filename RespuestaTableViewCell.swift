//
//  RespuestaTableViewCell.swift
//  CyberHeroe
//
//  Created by Mario on 28/04/2018.
//  Copyright © 2018 Mario. All rights reserved.
//

import UIKit

class RespuestaTableViewCell: UITableViewCell {

    @IBOutlet weak var respuesta: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let separator = UIView(frame:CGRect(x:0 , y:0, width: self.frame.size.width, height: 0.5))
        separator.backgroundColor = UIColor.clear
        self.addSubview(separator)

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
