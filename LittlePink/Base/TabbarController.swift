//
//  TabbarController.swift
//  LittlePink
//
//  Created by Apple on 2021/8/6.
//

import UIKit
import YPImagePicker
class TabbarController: UITabBarController,UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
    }
   
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        //判断是不是类型
        if viewController is PostVC{
            //待做(判断是否登录如果没有跳转到页面)
            
            ImagePickers()
            return false
        }
        return true
    }
   
    func ImagePickers(){
        
        var config = YPImagePickerConfiguration()
        
        //适配ipad
        let preferredContentSize = CGSize(width: 500, height: 600);
        YPImagePickerConfiguration.widthOniPad = preferredContentSize.width;
        
        //禁止编辑时候左右滑动
        config.isScrollToChangeModesEnabled = false
        //是否设置照片拍照只拍正方形
        config.onlySquareImagesFromCamera = false
        //是否自动保存
        config.shouldSaveNewPicturesToAlbum = true
        //保存的相册名字
        config.albumName =  Bundle.main.appName
        //指定一开始打开相册
        config.startOnScreen = .library
        //设置支持样式 相册 视频 文件
        config.screens = [.library, .video, .photo]
        //相机的变焦指数
        config.maxCameraZoomFactor = 5.0
        
        //MARK: 相册配置
        config.library.onlySquare = true
        //默认展示正方形
        config.library.isSquareByDefault = true
        //预览宽度防止长图
        config.library.minWidthForItem = nil
        //用户可以选择相册中那些媒体类型
        config.library.mediaType = YPlibraryMediaType.photoAndVideo
        //支持多选 true 默认是单选false
        config.library.defaultMultipleSelection = true
        //多选多少张
        config.library.maxNumberOfItems = kMaxPhotoCount
        config.library.minNumberOfItems = 1
        //缩略图一行多少个
        config.library.numberOfItemsInRow = 4
        //缩略图间隙
        config.library.spacingBetweenItems = 1.0
        //是否准许编辑页面
        config.library.skipSelectionsGallery = false
        //是否默认选择第一张最近的
        config.library.preSelectItemOnMultipleSelection = true
        
        //MARK: 配置视频
        //视频压缩这里不设置 在最后上传编辑哪里压缩
//        config.video.compression = AVAssetExportPresetHighestQuality
        
        config.video.fileType = .mov
        //最大时长
        config.video.recordingTimeLimit = 60.0
        //相册选取视频最大时长
        config.video.libraryTimeLimit = 60.0
        //最短时长
        config.video.minimumTimeLimit = 3.0
        //允许剪辑最大时长超过60秒不能剪辑
        config.video.trimmerMaxDuration = 60.0
        //最短剪辑时长低于3秒不能操作
        config.video.trimmerMinDuration = 3.0
        
        //多选编辑是否增加删除按钮 默认是true没有删除
        config.gallery.hidesRemoveButton = false
        
   
        
        let picker = YPImagePicker(configuration: config)
        //防止循环引用 [unowned picker]
        picker.didFinishPicking { [unowned picker] items, cancelled in
            if cancelled{
                print("用户点击了取消按钮")
            }
            //多选循环
//            picker.didFinishPicking { [unowned picker] items, cancelled in
//                for item in items {
//                    switch item {
//                    case .photo(let photo):
//                        print(photo)
//                    case .video(let video):
//                        print(video)
//                    }
//                }
//                picker.dismiss(animated: true, completion: nil)
//            }
            picker.dismiss(animated: true, completion: nil)
        }
        present(picker, animated: true, completion: nil)
        
    }

}
