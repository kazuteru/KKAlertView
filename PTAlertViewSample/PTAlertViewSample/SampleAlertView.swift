//
//  SampleAlertView.swift
//  PTAlertView
//
//  Created by 小橋　一輝 on 2015/03/27.
//  Copyright (c) 2015年 kobashi kazuki. All rights reserved.
//

import UIKit
import PTAlertView

class SampleAlertView: PTAlertView {
    
    @IBOutlet weak var button: UIButton!
    
    
    @IBAction func alert(sender: AnyObject) {
        dismiss()
    }
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 10.0
        self.layer.masksToBounds = true
    }
}