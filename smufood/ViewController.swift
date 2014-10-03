//
//  ViewController.swift
//  smufood
//
//  Created by Samuel Hunter on 9/28/14.
//  Copyright (c) 2014 Samuel Hunter. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var appsTableView : UITableView?
    
    var elements = [OpenHours]()
    
    var firebasehelp : FirebaseHelper! //implicitly unwrapped optional

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        if firebasehelp == nil {
            firebasehelp = FirebaseHelper { data in
                dispatch_async(dispatch_get_main_queue()) {
                    self.elements = data
                    
                    self.tableView.reloadData()
                }
            }
        }
        
        firebasehelp.startObserving()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        firebasehelp.stopObserving()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyTestCell")
        
        cell.textLabel?.text = "Row #\(indexPath.row)"
        cell.detailTextLabel?.text = "Subtitle #\(indexPath.row)"
        
        return cell
        
        /*let cell = tableView.dequeueReusableCellWithIdentifier("MyTestCell", forIndexPath: indexPath) as UITableViewCell
        
        
        
        cell.textLabel!.font = UIFont(name: cell.textLabel!.font.fontName, size: 14)
        cell.textLabel!.text = "something"
        
        cell.detailTextLabel!.font = UIFont(name: cell.textLabel!.font.fontName, size: 10)
        
        
        return cell*/
    }

}

