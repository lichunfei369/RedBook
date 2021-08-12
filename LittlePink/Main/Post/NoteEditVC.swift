//
//  NoteEditVC.swift
//  LittlePink
//
//  Created by Apple on 2021/8/11.
//

import UIKit
import YPImagePicker
import MBProgressHUD
import SKPhotoBrowser
class NoteEditVC: UIViewController {
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    var photos = [UIImage(named: "1")!,UIImage(named: "2")!]
    //计算属性节省资源
    var photoCount:Int{photos.count}
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }


}

extension NoteEditVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //这里如果没有as 自己创建cell是是找不到cell属性的
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPhotoCellID, for: indexPath) as! PhotoCell
        cell.imageView.image = photos[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        //不推荐 如果只有一个这样操作可以 如果头和尾同时有不推荐
//       let photoFooter =  collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kPhotoFooterID, for: indexPath) as! PhotoFooter
//        return photoFooter;
        
        //区分是头还是尾
        switch kind {
        
        case UICollectionView.elementKindSectionFooter:
            let photoFooter =  collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kPhotoFooterID, for: indexPath) as! PhotoFooter
            photoFooter.addPhotoFootBt.addTarget(self, action: #selector(addPhoto), for: .touchUpInside)
            return photoFooter
        default:
            fatalError("UICollectionViewFooter出问题了")
            
        }
        
    }
    
}
extension NoteEditVC:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 1. create SKPhoto Array from UIImage
        var images : [SKPhoto] = []
        for photo in photos{
            images.append(SKPhoto.photoWithImage(photo))
        }
    
        // 2. create PhotoBrowser Instance, and present from your viewController.
        let browser =  SKPhotoBrowser(photos: images, initialPageIndex: indexPath.item)
        browser.delegate = self
        SKPhotoBrowserOptions.displayDeleteButton = true
        present(browser, animated: true, completion: {})
    }
}
// MARK: -SKPhotoBrowserDelegate
extension NoteEditVC:SKPhotoBrowserDelegate{
    func removePhoto(_ browser: SKPhotoBrowser, index: Int, reload: @escaping (() -> Void)) {
        photos.remove(at: index)
        photoCollectionView.reloadData()
        reload()//重新加载方法视图
    }
}
// MARK: - 监听点击
extension NoteEditVC{
    @objc private func addPhoto(sender:UIButton){
        if photoCount < kMaxPhotoCount{
            var config = YPImagePickerConfiguration()
            
            //适配ipad
            let preferredContentSize = CGSize(width: 500, height: 600);
            YPImagePickerConfiguration.widthOniPad = preferredContentSize.width;
            
            //保存的相册名字
            config.albumName =  Bundle.main.appName
            //设置支持样式 相册 视频 文件
            config.screens = [.library]
            
           
            //支持多选 true 默认是单选false
            config.library.defaultMultipleSelection = true
            //选择最大数量
            config.library.maxNumberOfItems = kMaxPhotoCount - photoCount
            //缩略图间隙
            config.library.spacingBetweenItems = 1.0
            
            //多选编辑是否增加删除按钮 默认是true没有删除
            config.gallery.hidesRemoveButton = false
            
            let picker = YPImagePicker(configuration: config)
            //防止循环引用 [unowned picker]
            picker.didFinishPicking { [unowned picker] items, _ in
                for item in items {
                    if case let .photo(photo)  = item{
                        self.photos.append(photo.image)
                    }
                }
                self.photoCollectionView.reloadData()
                
                picker.dismiss(animated: true)
            }
            present(picker, animated: true)
        }else{
            self.showTextHUD("最多只能选择\(kMaxPhotoCount)张照片")
        }
    }
}
