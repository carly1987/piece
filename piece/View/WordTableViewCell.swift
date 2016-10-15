//
//  WordTableViewCell.swift
//  Piece
//
//  Created by cieldon on 16/3/17.
//  Copyright © 2016年 cieldon. All rights reserved.
//

import UIKit
import SnapKit
class WordTableViewCell: UITableViewCell{
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(style:UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier:reuseIdentifier)
        let title = UILabel()
        contentView.addSubview(title)
        title.backgroundColor = UIColor.whiteColor()
        title.snp_makeConstraints{ (make) -> Void in
            make.top.equalTo(contentView).offset(0)
            make.left.equalTo(contentView).offset(0)
            make.right.equalTo(contentView).offset(0)
            make.bottom.equalTo(contentView).offset(-1)
        }
        
//        let width = CGRectGetWidth( frame )
//        let f = contentView.frame
//        let fr = UIEdgeInsetsInsetRect(f, UIEdgeInsetsMake(10, 10, 10, 10))
//        contentView.frame = fr
//        contentView.backgroundColor = UIColor.redColor()
    }
//    override func layoutSubviews (){
//        super.layoutSubviews()
//       
//    }
}
