//
//  ViewController.swift
//  smufood
//
//  Created by Samuel Hunter on 9/28/14.
//  Copyright (c) 2014 Samuel Hunter. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UITableViewController {
    
    var restaurants = [Restaurant]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAsyncRequest()
        
    }
    
    func getAsyncRequest()
    {
        restaurants.removeAll(keepCapacity: false)
        let url = NSURL(string: "http://smufood.com/schedule")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) {(data, response, error) in
            
            var json: NSDictionary? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary
            
            if let err = error {
                println("error parsing json")
                return
            }
            
            
            var info : NSDictionary =  json!["data"] as NSDictionary
            var schedule : NSDictionary = info["schedule"] as NSDictionary
            
            
            var keys = schedule.allKeys
            var stringtest : String = keys[0] as String
            
            for i in 0...(schedule.count-1)
            {
                stringtest = keys[i] as String
                
                
                var restOpen : String = schedule[stringtest]!["open"] as String
                var restClose : String = schedule[stringtest]!["close"] as String
                
                var restDate =  TimeHelper.getCurrentDate()
                var rest = Restaurant(name: stringtest, open: restOpen, close: restClose, date: restDate)
                if (TimeHelper.isOpen(restOpen, timeClose: restClose))
                {
                    println("is open")
                    self.restaurants.append(rest)
                }
            }
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tableView.reloadData()
            })
            
        }
    
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyTestCell")
        
        //get dictionary for individual row
        if (restaurants.count > 0)
        {
            var rowData = restaurants[indexPath.row]
            
            cell.textLabel!.font = UIFont(name: cell.textLabel!.font.fontName, size: 14)
            cell.textLabel!.text = rowData.restName
            
            cell.detailTextLabel!.font = UIFont(name: cell.textLabel!.font.fontName, size: 10)
        }
        
        return cell
    }
}

