//
//  BackView.swift
//  KKAlertBackgroundView
//
//  Created by 小橋　一輝 on 2015/03/27.
//  Copyright (c) 2015年 kobashi kazuki. All rights reserved.
//

import UIKit

class KKAlertBackgroundView: UIView {
    var alertView: UIView?
    var cancel: (() -> Void)?
    var animator: UIDynamicAnimator!
    var backgroundColorShowingAlert = UIColor.blackColor().colorWithAlphaComponent(0.2)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        animator = UIDynamicAnimator(referenceView: self)
        backgroundColor = self.backgroundColorShowingAlert.colorWithAlphaComponent(0.0)
    }
    
    func setAlert(alertView: UIView) {
        self.alertView = alertView
        self.alertView!.center.x = self.center.x
        if alertView is KKAlertView {
            var alertView = self.alertView as! KKAlertView
            alertView.delegate = self
        }
        addSubview(alertView)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showAlertView() {
        //managerを使用
        ShowAnimationManager.sharedInstance.attachmentAnimation(self.animator,
            view: alertView!,
            animations: {
                self.backgroundColor = self.backgroundColorShowingAlert
        }, completion: nil)
    }
    
    
    func dismissAlertView() {
        //gravityBehaviorがdelegateをcatchできないため、UIViewのanimeのdelayを利用
        DismissAnimationManager.sharedInstance.gravityAnimation(self.animator,
            view: alertView!,
            animations: { self.backgroundColor = self.backgroundColorShowingAlert.colorWithAlphaComponent(0.0) },
            completion: { if let cancel = self.cancel { cancel() } })
    }
    
    //swift1.2より変更
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        if let alertView = alertView {
            if let touch = touches.first as? UITouch {
                let location = touch.locationInView(self)
                if checkTouch(location!) {
                    dismissAlertView()
                }
            }
        }
    }
    
    func checkTouch(location: CGPoint) -> Bool {
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

extension KKAlertBackgroundView: KKAlertViewDelegate {
    func dismissAlertView(alertView: KKAlertView) {
        dismissAlertView()
    }
}