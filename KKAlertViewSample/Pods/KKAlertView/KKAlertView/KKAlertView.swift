//
//  KKAlertView.swift
//  KKAlertView
//
//  Created by 小橋　一輝 on 2015/03/26.
//  Copyright (c) 2015年 kobashi kazuki. All rights reserved.
//

import UIKit

@objc public protocol KKAlertViewDelegate {
    optional func dismissAlertView(KKAlertView: KKAlertView)
}

public class KKAlertView: UIView {
    
    public var delegate: KKAlertViewDelegate?
    
    init () {
        super.init()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func dismiss() {
        if let delegate = delegate { delegate.dismissAlertView!(self) }
    }
}