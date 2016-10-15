//
//  DetailViewController.swift
//  Piece
//
//  Created by cieldon on 16/3/18.
//  Copyright © 2016年 cieldon. All rights reserved.
//

import UIKit
import SnapKit
import SwiftyJSON
class DetailViewController: UIViewController{
    var groupModel : WordModel!
    var word: UILabel!
    var desc: UITextView!
    var wordString: String!
    var descString: String!
    var Id : Int!
    var GroupId : Int!
    var line: UIView!
    init (groupId: Int!, id: Int!){
        super.init(nibName: nil, bundle: nil)
        wordString = ""
        descString = ""
        groupModel = WordModel()
        Id = nil
        if (id != nil){
            Id = id
        }
        GroupId = nil
        if (groupId != nil){
            GroupId = groupId
        }
        if let item = groupModel.getWordData(Id, groupIndex: GroupId){
            wordString = item.valueForKey("word") as? String
            descString = item.valueForKey("desc") as? String
        }
        self.title = wordString
        let Edit = UIBarButtonItem(title: "Edit", style: .Done, target: self, action: "editWord:")
        self.navigationItem.setRightBarButtonItem(Edit, animated: false)
        view.backgroundColor = UIColor.whiteColor()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder : aDecoder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        word = UILabel()
        word.text = wordString
        word.font = UIFont.monospacedDigitSystemFontOfSize(20, weight: 0)
        word.adjustsFontSizeToFitWidth = true
        view.addSubview(word)
        word.snp_makeConstraints{ (make) -> Void in
            make.top.equalTo(view).offset(64)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(10)
            make.height.equalTo(50)
        }
        
        desc = UITextView()
        desc.text = descString
        desc.editable = false
        desc.font = UIFont.monospacedDigitSystemFontOfSize(22, weight: 0)
        desc.textColor = UIColor(red: 98/255, green: 98/255, blue: 98/255, alpha: 1.0)
        view.addSubview(desc)
        desc.snp_makeConstraints{ (make) -> Void in
            make.top.equalTo(view).offset(114)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(10)
            make.bottom.equalTo(view).offset(0)
        }
        line = UIView()
        line.backgroundColor = UIColor(red: 45/255, green: 45/255, blue: 45/255, alpha: 0.3)
        view.addSubview(line)
        line.snp_makeConstraints{ (make) -> Void in
            make.top.equalTo(view).offset(115)
            make.left.equalTo(view).offset(0)
            make.right.equalTo(view).offset(0)
            make.height.equalTo(1)
        }
    }
    
    func editWord(btn:UIBarButtonItem){
        self.navigationController?.pushViewController(EditWordViewController(groupId:GroupId, id: Id), animated: false)
    }
    
    func refresh(){
        groupModel = WordModel()
        if let item = groupModel.getWordData(Id, groupIndex: GroupId){
            wordString = item.valueForKey("word") as? String
            descString = item.valueForKey("desc") as? String
        }
        self.title = wordString
        word.text = wordString
        desc.text = descString
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
       refresh()
    }
}
