//
//  NoteEditVC.swift
//  LittlePink
//
//  Created by Apple on 2021/8/11.
//

import UIKit
//import YPImagePicker
//import MBProgressHUD
//import SKPhotoBrowser
//import AVKit
class NoteEditVC: UIViewController {
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    @IBOutlet weak var titleTextFieid: UITextField!
    @IBOutlet weak var titleCountLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    //用于图片预判添加
    var photos = [UIImage(named: "1")!,UIImage(named: "2")!]
    //用于预览视频
//    var videoUrl:URL = Bundle.main.url(forResource: "testVideo", withExtension:"mp4")!
    var videoUrl:URL?
    
    //计算属性节省资源
    var photoCount:Int{photos.count}
    
    //如果不等于nil代表选中的是视频
    var isVieo:Bool{videoUrl != nil}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }

    //开始编辑
    @IBAction func TFEditBegin(_ sender: Any) {
        //显示字数
        titleCountLabel.isHidden = false
    }
    //结束编辑
    @IBAction func TFEditEnd(_ sender: Any) {
        //隐藏字数
        titleCountLabel.isHidden = true
    }
    // done 键盘回收
    @IBAction func TFEndOnExit(_ sender: Any) {
    }
    //用户输入调用
    @IBAction func TFEditChanged(_ sender: Any) {
        guard titleTextFieid.markedTextRange == nil else {return}
        //判断输入的值如果大于最大输入的值
        if titleTextFieid.unwrappedText.count > kMaxNoteTitleCount{
            //多出来的字截取掉从前面开始截取最大可输入字符
            titleTextFieid.text = String(titleTextFieid.unwrappedText.prefix(kMaxNoteTitleCount))
            
            //改变光标位置需要改变文本选择范围放在主线程中
            DispatchQueue.main.async {
                //获取光标的位置
                let end = self.titleTextFieid.endOfDocument
                //设置光标到文本的最后
                self.titleTextFieid.selectedTextRange = self.titleTextFieid.textRange(from: end, to: end)
            }
            
        }
        titleCountLabel.text  = "\(kMaxNoteTitleCount - titleTextFieid.unwrappedText.count)"
    }
    
}

extension NoteEditVC:UITextFieldDelegate{
    
    /*
     输入之前的方法
     
     range.location 输入字符的索引
     string 输入的文字
     
     
     布局优先级的知识当谁的值高谁就不会优先被压缩低的会自动拉伸 250
     
     */
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //判断是否超过字数
//        if  range.location >= kMaxNoteTitleCount || (textField.unwrappedText.count +  string.count) > kMaxNoteTitleCount{
//            return false
//        }
        
        let isExceed = range.location >= kMaxNoteTitleCount || (textField.unwrappedText.count +  string.count) > kMaxNoteTitleCount
        
        if isExceed {showTextHUD("输入最多输入\(kMaxNoteTitleCount)")}
            
        
        return !isExceed
    }
}
