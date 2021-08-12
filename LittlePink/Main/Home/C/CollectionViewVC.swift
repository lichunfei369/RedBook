//
//  CollectionViewVC.swift
//  LittlePink
//
//  Created by Apple on 2021/8/12.
//

//如果用代码写某个模块 UITableView programmatically swift 意思是以变成方式

import UIKit

class CollectionViewVC: UIViewController,UICollectionViewDataSource{
 
    private let photo = [UIImage(named: "1"),UIImage(named: "2")]
    lazy private var heardC:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        //设置水平滑动
        layout.scrollDirection = .horizontal
        //设置宽高
        layout.itemSize = CGSize(width: 90, height: 90)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //关闭自动布局
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .systemBackground
        cv.register(heardCell.self, forCellWithReuseIdentifier: "Cell")
        cv.dataSource = self
        return cv
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(heardC)
        setUI()
    }
    
    private func setUI(){
        //适配刘海屏
        heardC.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        heardC.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16).isActive = true
        heardC.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        heardC.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! heardCell
        cell.imageView.image = photo[indexPath.item]
        return cell
    }
    
}

class heardCell: UICollectionViewCell {
    
    lazy var  imageView:UIImageView =  {
        let imageView = UIImageView()
        //设置imageView mode
        imageView.contentMode = .scaleToFill
        //用于确定视图的自动调整大小掩码是否转换为自动布局约束。
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //下面两个要一起书写
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        setUI()
    }
    required init?(coder: NSCoder) {
        fatalError("xxx")
    }
    
    private func setUI() {
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
    }
}
