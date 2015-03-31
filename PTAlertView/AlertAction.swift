//
//  AlertAction.swift
//  PTAlertView
//
//  Created by 小橋　一輝 on 2015/03/27.
//  Copyright (c) 2015年 kobashi kazuki. All rights reserved.
//

import UIKit

public class AlertAction: NSObject {
    public var title: String = ""
    public var action: (() -> Void)?
    
    public init(title: String, action: (() -> Void)?) {
        self.title = title
        self.action = action
    }
}