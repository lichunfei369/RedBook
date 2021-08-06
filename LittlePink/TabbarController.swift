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
        if let vc = viewController as? PostVC{
            ImagePickers()
            return false
        }
        return true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func ImagePickers(){
        
        var config = YPImagePickerConfiguration()
        //禁止编辑时候左右滑动
        config.isScrollToChangeModesEnabled = false
        //是否设置照片拍照只拍正方形
        config.onlySquareImagesFromCamera = false
        //是否自动保存
        config.shouldSaveNewPicturesToAlbum = true
        //保存的相册名字
        config.albumName =  Bundle.main.appName
        config.startOnScreen = .library
        //设置支持样式 相册 视频 文件
        config.screens = [.library, .video, .photo]
        //设置裁剪
        config.showsCrop = .none
        config.targetImageSize = YPImageSize.original
        config.overlayView = UIView()
        config.hidesStatusBar = true
        config.hidesBottomBar = false
        config.hidesCancelButton = false
        config.preferredStatusBarStyle = UIStatusBarStyle.default
//        config.bottomMenuItemSelectedColour = UIColor(r: 38, g: 38, b: 38)
//        config.bottomMenuItemUnSelectedColour = UIColor(r: 153, g: 153, b: 153)
//        config.filters = [DefaultYPFilters...]
        config.maxCameraZoomFactor = 1.0
//        config.preSelectItemOnMultipleSelection = true
        let picker = YPImagePicker(configuration: config)
        //防止循环引用 [unowned picker]
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
            }
            picker.dismiss(animated: true, completion: nil)
        }
        present(picker, animated: true, completion: nil)
        
    }

}
