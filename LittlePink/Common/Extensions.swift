//
//  Extensions.swift
//  LittlePink
//
//  Created by Apple on 2021/8/6.
//

import Foundation
import UIKit

// MARK: -

extension UITextField {
    var unwrappedText:String{text ?? ""}
}

// MARK: - 扩展圆角方法
extension UIView{
    //为xib扩展方法
    @IBInspectable
    //名字
    var radius:CGFloat{
        get{
            layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
        }
    }
}
extension UIViewController {
    // MARK: - 展示架子啊框或者提示
    
    // MARK: - 加载框手动隐藏
    
    // MARK: - 提示框自动隐藏
    func showTextHUD(_ title:String, _ subTitle:String? = nil){
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .text //不指定的话显示菊花和下面配置文本
        hud.detailsLabel.text = subTitle
        hud.label.text = title
        hud.hide(animated: true,afterDelay: 2)
    }
    
    func hideKeyboardWhenTappedAround(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        //为了与其他点击方法不冲突tableviewcell点击
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}

extension Bundle{
    var appName:String{
       return Bundle.main.infoDictionary!["CFBundleDisplayName"] as! String
    }
}



