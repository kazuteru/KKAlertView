//
//  PTAlertView.swift
//  PTAlertView
//
//  Created by 小橋　一輝 on 2015/03/26.
//  Copyright (c) 2015年 kobashi kazuki. All rights reserved.
//

import UIKit

@objc protocol PTAlertViewDelegate {
    optional func dismissAlertView(alertView: PTAlertView)
}

public class PTAlertView: UIView {
    
    var delegate: PTAlertViewDelegate? = nil
    
    public override init () {
        super.init()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func dismiss() {
        delegate?.dismissAlertView?(self)
    }
}