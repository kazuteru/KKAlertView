//
//  PTAlertViewController.swift
//  PTAlertView
//
//  Created by 小橋　一輝 on 2015/03/26.
//  Copyright (c) 2015年 kobashi kazuki. All rights reserved.
//

import UIKit

/**
*  Alertの挙動を操作する.
*/
public class PTAlertViewController: UIViewController {
    
    public var backView: PTAlertBackgroundView!
    public var alertWindow: UIWindow?
    //AnimationPattern
    public var pattern: AnyObject?
    //背景タップでアラートをdismissするかどうか
    public var canDisimissAlertToTouchBack = true
    //背景色を設定
    public var backgroundViewColor: UIColor?
    
    public var defaultAlertView: DefaultPTAlertView?
    
    public override init() {
        super.init()
        
    }
    
    public override init(nibName:String!, bundle: NSBundle!) {
        super.init(nibName: nibName, bundle: bundle)
    }
    
    public init(view :UIView) {
       super.init()
    }
    
    public init(view: PTAlertView) {
       super.init()
    }
    
    public init(title: String?, message: String?) {
        super.init()
        defaultAlertView = DefaultPTAlertView(title: title, message: message)
    }
    
    public required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func addAction(#title: String, action: (() -> Void)?) {
        if let defaultAlertView = defaultAlertView { defaultAlertView.addAction(AlertAction(title: title, action: action)) }
    }
    
    public func showAlert() {
        if let defaultAlertView = defaultAlertView { showAlert(defaultAlertView.createAlertView()) }
    }
    
    public func showAlert(alertView: UIView) {
        backView = PTAlertBackgroundView(frame: CGRect(x: 0.0,
            y: -alertView.bounds.height,
            width: UIScreen.mainScreen().bounds.width,
            height: UIScreen.mainScreen().bounds.height + alertView.bounds.height))
        backView.cancel = { self.dismissPTAlertWindow() }
        if let backgroundViewColor = backgroundViewColor { backView.backgroundColorShowingAlert = backgroundViewColor }
        backView.setAlertView(alertView)
        view.addSubview(backView)
        showPTAlertWindow()
    }
    
    /**
    *  alertViewWindowの表示
    */
    private func showPTAlertWindow() {
        var window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window.rootViewController = self
        window.addSubview(view)
        window.makeKeyAndVisible()
        alertWindow = window
        backView.showAlertView()
    }
    
    /**
    *  alertViewWindowの非表示
    */
    private func dismissPTAlertWindow() {
        if let alertWindow = alertWindow {
            println("deleteWindow")
            let application = UIApplication.sharedApplication()
            if let nextWindowIndex = application.windows.indexesOfObject(alertWindow) {
                let nextWindow: UIWindow = application.windows[nextWindowIndex] as UIWindow
                nextWindow.makeKeyAndVisible()
                self.alertWindow = nil
            }
        }
    }
}

extension Array {
    func indexesOfObject<T : Equatable>(object:T) -> NSInteger? {
        for (index, obj) in enumerate(self) {
            if obj as T == object {
                return index
            }
        }
        return nil
    }
}