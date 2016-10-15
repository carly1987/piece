//
//  PieceNavigationController.swift
//  Piece
//
//  Created by cieldon on 16/3/17.
//  Copyright © 2016年 cieldon. All rights reserved.
//

import UIKit
class PieceNavigationController: UINavigationController{
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor = UIColor(red: 2/255, green: 193/255, blue: 73/255, alpha: 1.0)
        self.navigationBar.barStyle = .Black
        self.navigationBar.tintColor = UIColor.whiteColor()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
