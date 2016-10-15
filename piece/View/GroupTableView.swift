//
//  GroupTableView.swift
//  Piece
//
//  Created by cieldon on 16/4/12.
//  Copyright © 2016年 cieldon. All rights reserved.
//

import UIKit
import SnapKit
import SwiftyJSON
import DrawerController
class GroupTableView: UITableViewController{
    var header : UINavigationBar!
    var groupModel : WordModel!
    var groupList : JSON!
    var defaults = NSUserDefaults.standardUserDefaults()
    var drawerController :DrawerController? = nil
    override init(style: UITableViewStyle){
        super.init(style: style)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        groupModel = WordModel()
        groupList = []
        if let data = groupModel.getGroupList(){
            groupList = data
        }
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.registerClass(GroupTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func refresh() {
        groupModel = WordModel()
        groupList = []
        if let data = groupModel.getGroupList(){
            groupList = data
        }
        self.tableView.reloadData()
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupList!.count + 1
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let listcell = cell as! GroupTableViewCell
        print(groupModel.getGroupData(indexPath.row, groupList: groupList!))
        if let item = groupModel.getGroupData(indexPath.row, groupList: groupList!) {
            listcell.textLabel!.text = item.valueForKey("title") as? String
            listcell.detailTextLabel!.text = item.valueForKey("total") as? String
        }
        if(indexPath.row == groupList!.count){
            cell.editing = false
            cell.accessoryType = .None
            cell.editingAccessoryType = .None
            cell.textLabel?.text = "+ Add a group"
            cell.textLabel?.textColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1.0)
            cell.textLabel?.font = UIFont.monospacedDigitSystemFontOfSize(14, weight: 0)
        }
        return cell
        
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            groupModel.deleteGroup(indexPath.row)
            refresh()
        }
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        defaults.setObject(indexPath.row, forKey: "groupId")
        self.evo_drawerController?.toggleDrawerSide(.Left, animated: true, completion: nil)
    }
    
}
