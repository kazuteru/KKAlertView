//
//  DismissAnimationManager.swift
//  KKAlertView
//
//  Created by 小橋　一輝 on 2015/03/28.
//  Copyright (c) 2015年 kobashi kazuki. All rights reserved.
//

import UIKit

class DismissAnimationManager {
    class var sharedInstance :DismissAnimationManager {
        struct Static {
            static let instance = DismissAnimationManager()
        }
        return Static.instance
    }
    
    func gravityAnimation(animator: UIDynamicAnimator, view: UIView, animations: (() -> Void)?, completion: (() -> Void)?) {
        UIView.animateWithDuration(
            0.1,
            delay: 0.3,
            options: UIViewAnimationOptions.CurveEaseIn,
            animations: {
                if let animations = animations { animations() }
            },
            completion:{
                (value: Bool) in
                if let completion = completion { completion() }
            }
        )
        animator.removeAllBehaviors()
        var gravityBehavior = UIGravityBehavior(items: [view])
        gravityBehavior.gravityDirection = CGVector(dx: 0.0, dy: 10.0)
        animator.addBehavior(gravityBehavior)
        
        var itemBehavior = UIDynamicItemBehavior(items: [view])
        itemBehavior.addAngularVelocity(CGFloat(-M_PI_2), forItem: view)
        animator.addBehavior(itemBehavior)
    }
}