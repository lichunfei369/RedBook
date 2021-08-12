//
//  PostExtension.swift
//  LittlePink
//
//  Created by Apple on 2021/8/12.
//

import Foundation
// MARK: - UICollectionViewDragDelegate 拖拽
extension NoteEditVC:UICollectionViewDragDelegate{
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let photo = photos[indexPath.item]
        let dragItem = UIDragItem(itemProvider: NSItemProvider(object:photo))
        dragItem.localObject = photo
        return [dragItem]
        
    }
    //若一次拖动多个,需要时间itemsForAddingTo方法
    //若需改变拖拽时 cell 外观需要实现dragPreviewParametersForItemAt方法
    
}
// MARK: - UICollectionViewDropDelegate
extension NoteEditVC:UICollectionViewDropDelegate{
    
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        if collectionView.hasActiveDrag{
            //拖拽移动
            return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        }
        //禁止拖拽
        return UICollectionViewDropProposal(operation: .forbidden)
    }
    
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator){
       //拖拽
        if coordinator.proposal.operation == .move,
           let item = coordinator.items.first ,
           let sourceIndexPath = item.sourceIndexPath,
           let destinationIndexPath = coordinator.destinationIndexPath{
            //批量更新
            collectionView.performBatchUpdates {
                //移动先删除后添加
                photos.remove(at:sourceIndexPath.item)
                photos.insert(item.dragItem.localObject as! UIImage, at: destinationIndexPath.item)
                //更新视图
                collectionView.moveItem(at: sourceIndexPath, to: destinationIndexPath)
            }
            coordinator.drop(item.dragItem, toItemAt: destinationIndexPath)
        
        }
    }
    

}
