//
//  KKAlertViewController.swift
//  KKAlertView
//
//  Created by 小橋　一輝 on 2015/03/26.
//  Copyright (c) 2015年 kobashi kazuki. All rights reserved.
//

import UIKit

/**
*  Alertの挙動を操作する.
*/
class KKAlertViewController: UIViewController {
    
    var backView: KKAlertBackgroundView!
    var alertWindow: UIWindow?
    //AnimationPattern
    var pattern: AnyObject?
    //背景タップでアラートをdismissするかどうか
    var canDisimissAlertToTouchBack = true
    //背景色を設定
    var backgroundViewColor: UIColor?
    
    var defaultAlertView: DefaultKKAlertView?
    
    override init() {
        super.init()
        
    }
    
    override init(nibName:String!, bundle: NSBundle!) {
        super.init(nibName: nibName, bundle: bundle)
    }
    
    init(view :UIView) {
       super.init()
    }
    
    init(view: KKAlertView) {
       super.init()
    }
    
    init(title: String?, message: String?) {
        super.init()
        defaultAlertView = DefaultKKAlertView(title: title, message: message)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addAction(#title: String, action: (() -> Void)?) {
        if let defaultAlertView = defaultAlertView { defaultAlertView.addAction(AlertAction(title: title, action: action)) }
    }
    
    func showAlert() {
        if let defaultAlertView = defaultAlertView { showAlert(defaultAlertView.createAlertView()) }
    }
    
    func showAlert(alertView: UIView) {
        backView = KKAlertBackgroundView(frame: CGRect(x: 0.0,
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