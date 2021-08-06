//
//  WaterfallVC.swift
//  LittlePink
//
//  Created by lichunfei on 2021/8/5.
//

import UIKit
import XLPagerTabStrip
import CHTCollectionViewWaterfallLayout
class WaterfallVC: UICollectionViewController {
    var channel = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout  = collectionView.collectionViewLayout as! CHTCollectionViewWaterfallLayout
        layout.columnCount = 2
        //列与列的间隙 左右
        layout.minimumColumnSpacing = kWaterfallPadding
        //行与行 上下
        layout.minimumInteritemSpacing = kWaterfallPadding
        //上下左右间距
        layout.sectionInset = UIEdgeInsets(top: 0, left: kWaterfallPadding, bottom: kWaterfallPadding, right: kWaterfallPadding)
        //设置最后一张图片填充顺序方向
//        layout.itemRenderDirection = .leftToRight

    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
  
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
   
        return 13
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kWaterfallCellID, for: indexPath) as! WaterfallCell
        
        cell.imageView.image = UIImage(named: "\(indexPath.item + 1 )")
    
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
// MARK: - 有几个列表就循环多少超出报错
extension WaterfallVC:CHTCollectionViewDelegateWaterfallLayout{
    func collectionView(_ collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewLayout!, sizeForItemAt indexPath: IndexPath!) -> CGSize {
        UIImage(named: "\(indexPath.item + 1)")!.size
    }
}

extension WaterfallVC:IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: channel)
    }
}
