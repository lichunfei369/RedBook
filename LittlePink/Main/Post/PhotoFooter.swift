//
//  PhotoFooter.swift
//  LittlePink
//
//  Created by Apple on 2021/8/12.
//

import UIKit

class PhotoFooter: UICollectionReusableView {
        
    @IBOutlet weak var addPhotoFootBt: UIButton!
    //storyBoard
    override  func awakeFromNib() {
        super.awakeFromNib()
        addPhotoFootBt.layer.borderWidth = 1
        addPhotoFootBt.layer.borderColor = UIColor.tertiaryLabel.cgColor //转cgColor
    }
}
