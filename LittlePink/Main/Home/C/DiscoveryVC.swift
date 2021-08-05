//
//  DiscoveryVC.swift
//  LittlePink
//
//  Created by Apple on 2021/8/5.
//

import UIKit
import XLPagerTabStrip
class DiscoveryVC: UIViewController,IndicatorInfoProvider{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "发现")
    }

}
