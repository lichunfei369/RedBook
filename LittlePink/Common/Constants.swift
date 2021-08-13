//
//  Constants.swift
//  LittlePink
//
//  Created by Apple on 2021/8/5.
//

import UIKit

// MARK: StoryboardID
let kFollwVCID   = "FollwVCID"
let kNearByVCID  = "NearByVCID"
let kDiscoveryID = "DiscoveryID"
let kWaterfallID = "WaterfallID" 
let NoteEditVCID = "NoteEditVCID"
// MARK: CellID 
let kWaterfallCellID = "WaterfallCellID"
let kPhotoFooterID = "PhotoFooterID"
let kPhotoCellID = "PhotoCellID"
// MARK: 瀑布流间隙
let kWaterfallPadding: CGFloat = 4
let kMaxPhotoCount = 9
// MARK: 状态栏高度
let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
let statusHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
let naHeight = statusHeight + 44

let kChannels = ["推荐","旅行","娱乐","才艺","美妆","白富美","美食","萌宠"]
//最大输入数量
let kMaxNoteTitleCount = 20
