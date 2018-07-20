//
//  TableCell.swift
//  Field Survey
//
//  Created by Hao Ding on 2018/7/21.
//  Copyright © 2018年 Hao Ding. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {
    
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var classificationIconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
