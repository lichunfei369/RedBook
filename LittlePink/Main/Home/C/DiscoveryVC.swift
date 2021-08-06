//
//  DiscoveryVC.swift
//  LittlePink
//
//  Created by Apple on 2021/8/5.
//

import UIKit
import XLPagerTabStrip
class DiscoveryVC: ButtonBarPagerTabStripViewController{
    
    override func viewDidLoad() {
        
        self.selectedBar()
        super.viewDidLoad()
        //禁止右滑动
        containerView.bounces = false
        //设置选中和未选中颜色变化
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            //未被选中
            oldCell?.label.textColor = .secondaryLabel
            //选中
            newCell?.label.textColor = .label

            if animated {
                UIView.animate(withDuration: 0.1, animations: { () -> Void in
                    newCell?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    oldCell?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                })
            }
            else {
                newCell?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                oldCell?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        }
    }
    // MARK: - 设置选中bar
    func selectedBar () {
        //设置滑动条高度
        settings.style.selectedBarHeight = 0
        //去除 BackgroundColor
        settings.style.buttonBarItemBackgroundColor = .clear
        //字体加粗
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
        //设置barItem大小
        settings.style.buttonBarItemLeftRightMargin = 0
   
    }
    //添加控制器
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        var vcs:[UIViewController] = []
        for channel in kChannels{
            let vc = storyboard!.instantiateViewController(identifier: kWaterfallID) as! WaterfallVC
            vc.channel = channel
            vcs.append(vc)
        }
        return vcs
    }
}

extension DiscoveryVC:IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: NSLocalizedString("discovery", comment: "String"))
    }
}
