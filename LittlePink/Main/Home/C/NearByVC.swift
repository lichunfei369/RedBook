//
//  NearByVC.swift
//  LittlePink
//
//  Created by Apple on 2021/8/5.
//

import UIKit
import XLPagerTabStrip
class NearByVC: UIViewController ,IndicatorInfoProvider{
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "附近")
    }
}
