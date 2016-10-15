//
//  GroupsViewController.swift
//  Piece
//
//  Created by cieldon on 16/4/11.
//  Copyright © 2016年 cieldon. All rights reserved.
//

import UIKit
import SnapKit
import DrawerController
class GroupsViewController: UIViewController {
    var groupList : GroupTableView!
    var nav: UINavigationController!
    var drawerController :DrawerController? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        nav = self.navigationController
        let edit = UIBarButtonItem(title: "Edit", style: .Done, target: self, action: "editGroup:")
        edit.tintColor = UIColor.whiteColor()
        self.navigationItem.setRightBarButtonItem(edit, animated: false)
        let piece = UIBarButtonItem(title: "Piece", style: .Done, target: self, action: "home:")
        piece.tintColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1.0)
        self.navigationItem.setLeftBarButtonItem(piece, animated: false)
        nav.navigationBar.barTintColor = UIColor(red: 40/255, green: 40/255, blue: 40/255, alpha: 1.0)
        nav.navigationBar.translucent = false
        
        groupList = GroupTableView(style: .Plain)
        view.addSubview(groupList.view)
        groupList.view.backgroundColor = UIColor(red: 40/255, green: 40/255, blue: 40/255, alpha: 1.0)
        groupList.view.snp_makeConstraints{ (make) -> Void in
            make.top.equalTo(view).offset(0)
            make.left.right.bottom.equalTo(view).offset(0)
        }
    }
    func editGroup(btn:UIBarButtonItem){
        if groupList.editing {
            groupList.editing = false
            btn.title = "Edit"
        }else{
            groupList.editing = true
            btn.title = "End"
        }
    }
    func home(btn:UIBarButtonItem){
        self.evo_drawerController?.toggleDrawerSide(.Left, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}