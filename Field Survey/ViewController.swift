//
//  ViewController.swift
//  Field Survey
//
//  Created by Hao Ding on 2018/7/20.
//  Copyright © 2018年 Hao Ding. All rights reserved.
//

import UIKit
import Foundation


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var fieldTableView: UITableView!
    enum classification:String {
        case amphibian
        case bird
        case fish
        case insect
        case mammal
        case plant
        case reptile
    }
    let dateFormatter = DateFormatter()
    
    var fields:[Field] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm"
        let urlString = "https://cache.techinnovator.info/content/iOS/challenges/Field%20Survey/field_observations.json"
        
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with:url!) { (data, response, error) in
            if error != nil {
                print(error as Any)
            } else {
                do {
                    
                   let json = try JSONSerialization.jsonObject(with: data!) as! [String:Any]
                    //print(json)
                    if let dictionary = json["observations"] as? [Any] {
                        for index in 0...10{
                        if let each = dictionary[index] as? [String: Any]{
                            let classification = each["classification"] as? String
                            let title = each["title"] as? String
                            let description = each["description"] as? String
                            let dateString = each["date"] as? String
                            let date = self.dateFormatter.date(from: dateString!)
                            self.fields.append(Field(classification: classification!, title: title!, description: description!, date: date!))
                           
                        }
                        }
                        
                    }
                    else{
                        print("NO!!!!!!!!!")
                    }
                    
                    
                } catch let error as NSError {
                    print(error)
                }
            }
            
            }.resume()
        fieldTableView.dataSource = self
        fieldTableView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fields.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)
        if let cell = cell as? TableCell{
        let thefield = fields[indexPath.row]
        
        cell.titleLabel.text = thefield.title
        cell.dateLabel.text = thefield.date.description
        }
        return cell
    }
    override func prepare (for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController,
            let row = fieldTableView.indexPathForSelectedRow?.row {
            
        }
    }
    
}

