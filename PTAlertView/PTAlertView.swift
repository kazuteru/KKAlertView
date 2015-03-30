//
//  PTAlertView.swift
//  PTAlertView
//
//  Created by 小橋　一輝 on 2015/03/26.
//  Copyright (c) 2015年 kobashi kazuki. All rights reserved.
//

import Foundation
@objc protocol PTAlertViewDelegate {
    optional func dismissAlertView(PTAlertView: PTAlertView)
}

class PTAlertView: UIView {
    
    var delegate: PTAlertViewDelegate? = nil
    
    override init () {
        super.init()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func dismiss() {
        if let delegate = delegate { delegate.dismissAlertView!(self) }
    }
}