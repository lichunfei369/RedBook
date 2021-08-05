//
//  HomeVC.swift
//  LittlePink
//
//  Created by lichunfei on 2021/8/4.
//

import UIKit
import XLPagerTabStrip
class HomeVC: ButtonBarPagerTabStripViewController {

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
        //设置选中的默认是第二个
//        DispatchQueue.main.async {
//            self.moveToViewController(at: 1, animated: false)
//        }
       
        
    }
    
    // MARK: - 设置选中bar
    func selectedBar () {
        //设置滑动条颜色
        settings.style.selectedBarBackgroundColor = UIColor(named: "main")!
        //设置滑动条高度
        settings.style.selectedBarHeight = 3
        //去除 BackgroundColor
        settings.style.buttonBarItemBackgroundColor = .clear
        //设置字体颜色
        settings.style.buttonBarItemTitleColor = .label
        //字体加粗
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 16)
        //设置barItem大小
        settings.style.buttonBarItemLeftRightMargin = 0
   
    }
    //重写设置滑动条
//    override func calculateStretchedCellWidths(_ minimumCellWidths: [CGFloat], suggestedStretchedCellWidth: CGFloat, previousNumberOfLargeCells: Int) -> CGFloat {
//        10
//    }

    // MARK:必须实现这个方法否则报错
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let followVC = storyboard!.instantiateViewController(identifier: kFollwVCID)
        let nearByVC = storyboard!.instantiateViewController(identifier: kNearByVCID)
        let discoveryVC = storyboard!.instantiateViewController(identifier: kDiscoveryID)
        
        return [discoveryVC,followVC,nearByVC]
    }

    
    
}
