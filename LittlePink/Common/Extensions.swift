//
//  Extensions.swift
//  LittlePink
//
//  Created by Apple on 2021/8/6.
//

import Foundation

extension Bundle{
    var appName:String{
       return Bundle.main.infoDictionary!["CFBundleDisplayName"] as! String
    }
}
