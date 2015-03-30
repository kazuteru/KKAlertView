//
//  SampleViewController.swift
//  PTAlertView
//
//  Created by 小橋　一輝 on 2015/03/26.
//  Copyright (c) 2015年 kobashi kazuki. All rights reserved.
//

import UIKit

class SampleViewController: UIViewController {
    
   
    @IBOutlet weak var collectionView: UICollectionView!
    var sampleAction: [String]!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName:String!, bundle: NSBundle!) {
        super.init(nibName: nibName, bundle: bundle)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sampleAction = ["1 button alert", "2 button alert", "3 button alert", "original view alert", "changed background color", "sample"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.registerNib(UINib(nibName: "SampleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "sampleCollectionViewCell")
    }
}

/**
* UICollectionViewDataSource
*/
extension SampleViewController: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sampleAction.count
    }
    
    func collectionView(collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAtIndexPath indexPath:NSIndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 66.0)
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: SampleCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("sampleCollectionViewCell", forIndexPath: indexPath) as SampleCollectionViewCell
        cell.label.text = sampleAction[indexPath.row]
        return cell
    }
}

/**
* UICollectionViewDelegate
*/
extension SampleViewController: UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            var alertViewController = PTAlertViewController(title: "1 button alert", message: "How many bagels could a beagle bake if a beagle could bake bagels?")
            alertViewController.addAction(title: "button A", action: { println("Hello EX1") })
            alertViewController.showAlert()
            break
        case 1:
            var alertViewController = PTAlertViewController(title: "2 button alert", message: "How much wood would a woodchuck chuck if a woodchuck could chuck wood?")
            alertViewController.addAction(title: "button A", action: { println("Hello EX1") })
            alertViewController.addAction(title: "button B", action: { println("Hello EX2") })
            alertViewController.showAlert()
            break
        case 2:
            var alertViewController = PTAlertViewController(title: "3 button alert", message: "One smart fellow, he felt smart.Two smart fellows, they felt smart. Three smart fellows, they all felt smart.")
            alertViewController.addAction(title: "button A", action: { println("Hello EX1") })
            alertViewController.addAction(title: "button B", action: { println("Hello EX2") })
            alertViewController.addAction(title: "button C", action: { println("Hello EX3") })
            alertViewController.showAlert()
            break
        case 3:
            let view: SampleAlertView = UINib(nibName: "SampleAlertView", bundle: nil).instantiateWithOwner(self, options: nil)[0] as SampleAlertView
            PTAlertViewController().showAlert(view)
            break
        case 4:
            let view: SampleAlertView = UINib(nibName: "SampleRedAlertView", bundle: nil).instantiateWithOwner(self, options: nil)[0] as SampleAlertView
            var alertViewController = PTAlertViewController()
            alertViewController.backgroundViewColor = UIColor.redColor().colorWithAlphaComponent(0.5)
            alertViewController.showAlert(view)
            break
        case 5:
            break
        default:
            break
        }
    }
}

/**
*  cell calss
*/
class SampleCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        self.layer.borderColor = UIColor.blackColor().colorWithAlphaComponent(0.5).CGColor
        self.layer.borderWidth = 1.0
    }
}