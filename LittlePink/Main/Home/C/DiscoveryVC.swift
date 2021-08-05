//
//  DiscoveryVC.swift
//  LittlePink
//
//  Created by Apple on 2021/8/5.
//

import UIKit
import XLPagerTabStrip
class DiscoveryVC: ButtonBarPagerTabStripViewController,IndicatorInfoProvider{

    override func viewDidLoad() {
        super.viewDidLoad()

    }
//    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
//        let followVC = storyboard!.instantiateViewController(identifier: kFollwVCID)
//        let nearByVC = storyboard!.instantiateViewController(identifier: kNearByVCID)
//        let discoveryVC = storyboard!.instantiateViewController(identifier: kDiscoveryID)
//
//        return [discoveryVC,followVC,nearByVC]
//    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "发现")
    }
    
}
