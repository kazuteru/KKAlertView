//
//  DefaultKKAlertView.swift
//  KKAlertView
//
//  Created by 小橋　一輝 on 2015/03/27.
//  Copyright (c) 2015年 kobashi kazuki. All rights reserved.
//

import UIKit

class DefaultKKAlertView: KKAlertView {
    
    var title: String?
    var message: String?
    var actions: [AlertAction] = [AlertAction]()
    
    override init () {
        super.init()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(title: String?, message: String?) {
        super.init()
        self.title = title;
        self.message = message;
    }

    required  init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addAction(action: AlertAction) {
        actions.append(action)
    }
    
    func createAlertView() -> Self {
        var y: CGFloat = 0.0
        self.frame = CGRect(x: 0.0, y: 0.0, width: 280.0, height: 0.0)
        self.backgroundColor = UIColor.whiteColor()
        if let title = title {
            var titleLabel = UILabel(frame: CGRect(x: 5.0, y: 20.0, width: self.bounds.width - 10.0, height: 0.0))
            titleLabel.numberOfLines = 0
            titleLabel.text = title
            titleLabel.font = UIFont.boldSystemFontOfSize(20.0)
            titleLabel.sizeToFit()
            titleLabel.frame = CGRect(x: 5.0, y: 15.0, width: self.bounds.width - 10.0, height: titleLabel.bounds.height)
            titleLabel.textAlignment = .Center           
            self.addSubview(titleLabel)
            y += titleLabel.bounds.origin.y
            y += titleLabel.bounds.height
        }
        if let message = message {
            var messageLabel = UILabel(frame: CGRect(x: 5.0, y: y + 15.0, width: self.bounds.width - 10.0, height: 0.0))
            messageLabel.numberOfLines = 0
            messageLabel.text = message
            messageLabel.sizeToFit()
            self.addSubview(messageLabel)
            y += 15.0
            y += messageLabel.bounds.height
        }
        y += 20.0
        //add button
        y = addButtons(y, alertActions: actions)
        self.frame = CGRect(x: 0.0, y: 0.0, width: 280.0, height: y)
        //角丸処理
        self.layer.cornerRadius = 10.0
        self.layer.masksToBounds = true
        return self
    }
    
    private func addButtons(y: CGFloat, alertActions: [AlertAction]) -> CGFloat {
        switch alertActions.count {
        case 0:
            return y
        case 1:
            var button = createButton(CGRect(x: 0.0, y: y, width: self.bounds.width, height: 40), tag: 0)
            self.addSubview(button)
            return y + button.bounds.height
        case 2:
            var leftButton = createButton(CGRect(x: 0.0, y: y, width: self.bounds.width / 2.0, height: 40), tag: 0)
            self.addSubview(leftButton)
            var rightButton = createButton(CGRect(x: leftButton.bounds.origin.x + leftButton.bounds.width, y: y, width: self.bounds.width / 2.0, height: 40), tag: 1)
            var border = CALayer()
            border.frame = CGRect(x: 0.0, y: 0.0, width: 0.5, height: rightButton.bounds.height);
            border.backgroundColor =  UIColor.blackColor().colorWithAlphaComponent(0.1).CGColor
            rightButton.layer.addSublayer(border)
            self.addSubview(rightButton)
            return y + leftButton.bounds.height
        default:
            var afterY = y
            for var i = 0; i < alertActions.count; i++ {
                var button = createButton(CGRect(x: 0.0, y: afterY, width: self.bounds.width, height: 40), tag: i)
                self.addSubview(button)
                afterY = afterY + button.bounds.height
            }
            return afterY
        }
    }
    
    private func createButton(frame: CGRect, tag: NSInteger) -> UIButton {
        var button = UIButton(frame: frame)
        button.tag = tag
        button = setUpperBorder(button) as! UIButton
        button.setTitle(actions[tag].title, forState: .Normal)
        button.setTitleColor(UIColor.cyanColor(), forState: .Normal)
        button.addTarget(self, action: "executeAction:", forControlEvents: .TouchUpInside)
        return button
    }
    
    private func setUpperBorder(view: UIView) -> UIView {
        var border = CALayer()
        border.frame = CGRect(x: 0.0, y: 0.0, width: view.bounds.size.width, height: 0.5);
        border.backgroundColor =  UIColor.blackColor().colorWithAlphaComponent(0.1).CGColor
        view.layer.addSublayer(border)
        return view
    }
    
    func executeAction(button: UIButton) {
        if let action = actions[button.tag].action {
            action()
        }
    }

    
}