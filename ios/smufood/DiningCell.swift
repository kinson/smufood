//
//  DiningCell.swift
//  smufood
//
//  Created by Samuel Hunter on 1/13/15.
//  Copyright (c) 2015 Samuel Hunter. All rights reserved.
//

import Foundation
import UIKit

class DiningCell : UITableViewCell {
    
    var nameLabel : UILabel!
    var hoursLabel : UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //screen boundaries
        let box = self.bounds
        let boxWidth = box.width
        let boxHeight = box.height
        
        nameLabel = UILabel(frame: CGRect(x: boxWidth/30, y: boxHeight/3, width: boxWidth/5, height: boxHeight/3))
        hoursLabel = UILabel(frame: CGRect(x: boxWidth/1.43, y: boxHeight/3, width: boxWidth/3.57, height: boxHeight/3))
        self.addSubview(nameLabel)
        self.addSubview(hoursLabel)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
}
