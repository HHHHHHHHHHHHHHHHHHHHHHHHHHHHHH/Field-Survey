//
//  DetailViewController.swift
//  Field Survey
//
//  Created by Hao Ding on 2018/7/21.
//  Copyright © 2018年 Hao Ding. All rights reserved.
//

import UIKit
class DetailViewController: UIViewController {
    
    var fields: Field?
    
    var dateFormatter = DateFormatter()
    
    @IBOutlet weak var classificationIconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        //classificationIconImageView.image = fields?.classification.image
        titleLabel.text = fields?.title
        descriptionLabel.text = fields?.description
        
        if let date = fields?.date {
            dateLabel.text = dateFormatter.string(from: date)
        } else {
            dateLabel.text = ""
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
