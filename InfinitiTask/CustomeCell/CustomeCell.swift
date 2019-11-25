//
//  CustomeCell.swift
//  InfinitiTask
//
//  Created by Mac-OBS-06 on 23/11/19.
//  Copyright © 2019 OptisolBusinessSolutions. All rights reserved.
//

import UIKit

class CustomeCell: UITableViewCell {
    
    @IBOutlet weak var imgvw_checkbox: UIImageView!
    @IBOutlet weak var imgvw_option: UIImageView!
    @IBOutlet weak var lbl_option: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
