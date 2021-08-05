//
//  CollectionExtension.swift
//  LittlePink
//
//  Created by lichunfei on 2021/8/5.
//

import Foundation
import CHTCollectionViewWaterfallLayout

extension WaterfallVC:CHTCollectionViewDelegateWaterfallLayout{
    func collectionView(_ collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewLayout!, sizeForItemAt indexPath: IndexPath!) -> CGSize {
        UIImage(named: "\(indexPath.item + 1)")!.size
    }
    
    
}
