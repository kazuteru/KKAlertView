//
//  ShowAnimationManager.swift
//  KKAlertView
//
//  Created by 小橋　一輝 on 2015/03/28.
//  Copyright (c) 2015年 kobashi kazuki. All rights reserved.
//

import UIKit

class ShowAnimationManager {
    
    class var sharedInstance :ShowAnimationManager {
        struct Static {
            static let instance = ShowAnimationManager()
        }
        return Static.instance
    }
    
    func attachmentAnimation(animator: UIDynamicAnimator, view: UIView, animations: (() -> Void)?, completion: (() -> Void)?) {
        view.transform = CGAffineTransformMakeRotation(CGFloat(M_1_PI) / 2.0);
        UIView.animateWithDuration(
            0.1,
            delay: 0.0,
            options: UIViewAnimationOptions.CurveEaseIn,
            animations: {
                if let animations = animations { animations() }
                view.transform = CGAffineTransformMakeRotation(0);
            },
            completion:{
                (value: Bool) in
                if let completion = completion { completion() }
            }
        )
        animator.removeAllBehaviors()
        //anchor = 支点
        var attachmentBehavior = UIAttachmentBehavior(item: view, attachedToAnchor: CGPoint(x: view.center.x, y: 0.0))
        attachmentBehavior.length = UIScreen.mainScreen().bounds.height / 2.0 + view.bounds.height
        //減衰
        attachmentBehavior.damping = 0.3
        //頻度
        attachmentBehavior.frequency = 5
        animator.addBehavior(attachmentBehavior)
    }
}