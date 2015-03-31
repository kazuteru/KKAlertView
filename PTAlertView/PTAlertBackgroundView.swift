//
//  BackView.swift
//  PTAlertBackgroundView
//
//  Created by 小橋　一輝 on 2015/03/27.
//  Copyright (c) 2015年 kobashi kazuki. All rights reserved.
//

import UIKit

public class PTAlertBackgroundView: UIView {
    public var alertView: UIView?
    public var cancel: (() -> Void)?
    public var animator: UIDynamicAnimator!
    public var backgroundColorShowingAlert = UIColor.blackColor().colorWithAlphaComponent(0.2)
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        animator = UIDynamicAnimator(referenceView: self)
        backgroundColor = self.backgroundColorShowingAlert.colorWithAlphaComponent(0.0)
    }
    
    public func setAlertView(alertView: UIView) {
        self.alertView = alertView
        self.alertView!.center.x = self.center.x
        if alertView is PTAlertView {
            var alertView = self.alertView as PTAlertView
            alertView.delegate = self
        }
        addSubview(alertView)
    }
    
    public required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func showAlertView() {
        //managerを使用
        ShowAnimationManager.sharedInstance.attachmentAnimation(self.animator,
            view: alertView!,
            animations: {
                self.backgroundColor = self.backgroundColorShowingAlert
        }, completion: nil)
    }
    
    
    public func dismissAlertView() {
        //gravityBehaviorがdelegateをcatchできないため、UIViewのanimeのdelayを利用
        DismissAnimationManager.sharedInstance.gravityAnimation(self.animator,
            view: alertView!,
            animations: { self.backgroundColor = self.backgroundColorShowingAlert.colorWithAlphaComponent(0.0) },
            completion: { if let cancel = self.cancel { cancel() } })
    }
    
    public override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        if let alertView = alertView {
            let location = touches.anyObject()?.locationInView(self)
            if checkTouch(location!) {
                dismissAlertView()
            }
        }
    }
    
    public func checkTouch(location: CGPoint) -> Bool {
        if let alertView = alertView {
            if location.x < alertView.frame.origin.x {
                return true
            }
            if location.y < alertView.frame.origin.y {
                return true
            }
            if location.x > alertView.frame.origin.x + alertView.frame.width {
                return true
            }
            if location.y > alertView.frame.origin.y + alertView.frame.height {
                return true
            }
        }
        return false
    }
}

extension PTAlertBackgroundView: PTAlertViewDelegate {
    public func dismissAlertView(alertView: PTAlertView) {
        dismissAlertView()
    }
}