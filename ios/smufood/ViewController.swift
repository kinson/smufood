//
//  ViewController.swift
//  smufood
//
//  Created by Samuel Hunter on 9/28/14.
//  Copyright (c) 2014 Samuel Hunter. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var appsTableView : UITableView?
    var restaurants = [Restaurant]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        appsTableView = UITableView(frame: CGRect(x: 0, y: 10, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height))
        appsTableView!.dataSource = self
        appsTableView!.delegate = self
        appsTableView!.registerClass(DiningCell.classForCoder(), forCellReuseIdentifier: "DiningCell")
        appsTableView!.allowsSelection = false
        self.view.addSubview(appsTableView!)
        var refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        appsTableView!.addSubview(refreshControl)
        self.navigationItem.title = "SMUfood"
    }
    
    func refresh(sender:AnyObject)
    {
        getAsyncRequest()
    }
    
    func getAsyncRequest()
    {
        restaurants.removeAll(keepCapacity: false)
        let url = NSURL(string: "http://104.131.77.181/schedule")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            
            var json: NSDictionary? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary
            
            if let err = error {
                println("error parsing json")
                println(json)
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
                    self.restaurants.append(rest)
                }
            }
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.appsTableView!.reloadData()
            })
            
        }
    
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        getAsyncRequest()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("DiningCell", forIndexPath: indexPath) as DiningCell
        //let cell = DiningCell(style: UITableViewCellStyle.Default, reuseIdentifier: "DiningCell")
        
        
        //get dictionary for individual row
        if (restaurants.count > 0)
        {
            var rowData = restaurants[indexPath.row]
            tableView.rowHeight = 50;
            
            if (TimeHelper.almostClosed(rowData.restCloseParsed)) {
                cell.hoursLabel?.textColor = UIColor.redColor()
            }
            else {
                cell.hoursLabel?.textColor = UIColor.blackColor()
            }
            cell.hoursLabel?.text = "Until " + rowData.restClose
            cell.hoursLabel?.sizeToFit()
            cell.nameLabel?.text = rowData.realName
            cell.nameLabel?.sizeToFit()
            println(rowData.realName + " " + rowData.restClose)
        }
        
        return cell
    }
}

