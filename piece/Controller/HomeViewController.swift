//
//  HomeViewController.swift
//  Piece
//
//  Created by cieldon on 16/3/17.
//  Copyright © 2016年 cieldon. All rights reserved.
//

import UIKit
import SnapKit
import DrawerController
class HomeViewController: UIViewController{
    var wordList: WordTableView!
    var nav: UINavigationController!
    var drawerController :DrawerController? = nil
    var defaults = NSUserDefaults.standardUserDefaults()
    var groupId :Int? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        if let id = defaults.valueForKey("groupId") as? Int{
            groupId = id
        }else{
            groupId = 0
            defaults.setObject(groupId, forKey: "groupId")
        }
        self.title = "Piece"
        nav = self.navigationController
        let add = UIBarButtonItem(title: "Add", style: .Done, target: self, action: "addWord:")
        self.navigationItem.setRightBarButtonItem(add, animated: false)
        let group = UIBarButtonItem(title: "Group", style: .Done, target: self, action: "showGroups:")
        self.navigationItem.setLeftBarButtonItem(group, animated: false)
        wordList = WordTableView(style: .Plain, nav: nav, groupId:groupId)
        view.addSubview(wordList.view)
        wordList.view.backgroundColor = UIColor(red: 45/255, green: 45/255, blue: 45/255, alpha: 1.0)
        wordList.view.snp_makeConstraints{ (make) -> Void in
            make.top.equalTo(view).offset(64)
            make.left.right.bottom.equalTo(view).offset(0)
        }
    }
    
    func addWord(btn:UIBarButtonItem){
        nav.pushViewController(EditWordViewController(groupId:groupId!, id: nil), animated: false)
    }
    
    func showGroups(btn:UIBarButtonItem){
        self.evo_drawerController?.toggleDrawerSide(.Left, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        wordList.refresh()
    }
}