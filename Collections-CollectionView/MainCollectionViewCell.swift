//
//  MainCollectionViewCell.swift
//  Collections-CollectionView
//
//  Created by Irfan Lone on 4/8/16.
//  Copyright © 2016 Ilone Labs. All rights reserved.
//

import UIKit


class MainCollectionViewCell: UICollectionViewCell {
    
    var collectionViewDataSource : UICollectionViewDataSource!
    
    var collectionViewDelegate : UICollectionViewDelegate!
    
    var collectionView : UICollectionView!
    
    var collectionViewOffset: CGFloat {
        set {
            collectionView.contentOffset.x = newValue
        }
        
        get {
            return collectionView.contentOffset.x
        }
    }
    
    func initializeCollectionViewWithDataSource<D: protocol<UICollectionViewDataSource>,E: protocol<UICollectionViewDelegate>>(dataSource: D, delegate :E, forRow row: Int) {
        
        self.collectionViewDataSource = dataSource
        
        self.collectionViewDelegate = delegate
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .Horizontal
        
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: flowLayout)
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = UIColor.whiteColor()
        collectionView.dataSource = self.collectionViewDataSource
        collectionView.delegate = self.collectionViewDelegate
        collectionView.tag = row
        
        self.addSubview(collectionView)
        
        self.collectionView = collectionView
        
        var frame = self.bounds
        frame.size.width = 80
        frame.size.height = 25
        
        let button = UIButton(frame: frame)
        button.setTitle("Details >", forState: .Normal)
        button.setTitleColor(UIColor.purpleColor(), forState: .Normal)
        button.titleLabel?.font = UIFont(name: "Gillsans", size: 14)
        button.addTarget(self, action: #selector(MainCollectionViewCell.buttonAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(button)

        collectionView.reloadData()
    }
    
    func buttonAction(sender: UIButton!) {
        print("collection view number \(collectionView.tag)")
    }
    
}

