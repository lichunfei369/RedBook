//
//  NoteConfig.swift
//  LittlePink
//
//  Created by Apple on 2021/8/13.
//

import Foundation
extension NoteEditVC{
    func config(){
        //开启拖拽
        photoCollectionView.dragInteractionEnabled = true
        //点击空白键盘收回
        hideKeyboardWhenTappedAround()
        titleCountLabel.text = "\(kMaxNoteTitleCount)"
        //去除文本边距上下边距
        textView.textContainerInset = UIEdgeInsets(top: 0,
                                                   left: -textView.textContainer.lineFragmentPadding,
                                                   bottom: 0,
                                                   right: -textView.textContainer.lineFragmentPadding)
        //去除内容缩进左右边距
//        textView.textContainer.lineFragmentPadding = 
    }
}
