//
//  DayTableViewCell.swift
//  Memoir
//
//  Created by Monith Ilavarasan on 11/25/16.
//  Copyright © 2016 Sophia KC. All rights reserved.
//

import UIKit



class DayTableViewCell: UITableViewCell {
    
    @IBOutlet weak var numEntry: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var begEntry: UITextField!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
