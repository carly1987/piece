//
//  GroupTableViewCell.swift
//  Piece
//
//  Created by cieldon on 16/4/12.
//  Copyright © 2016年 cieldon. All rights reserved.
//

import UIKit
import SnapKit
class GroupTableViewCell: UITableViewCell{
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(style:UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: .Subtitle, reuseIdentifier:reuseIdentifier)
        self.backgroundColor = UIColor.clearColor()
        self.accessoryType = .DisclosureIndicator
        self.editingAccessoryType = .Checkmark
        self.editing = true
        self.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1.0)
        self.selectedBackgroundView?.backgroundColor = UIColor(red: 2/255, green: 193/255, blue: 73/255, alpha: 1.0)
        self.textLabel?.font = UIFont.monospacedDigitSystemFontOfSize(28, weight: 0)
        self.textLabel?.textColor = UIColor.whiteColor()
        self.detailTextLabel?.font = UIFont.monospacedDigitSystemFontOfSize(14, weight: 0)
        self.detailTextLabel?.textColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1.0)
    }
}