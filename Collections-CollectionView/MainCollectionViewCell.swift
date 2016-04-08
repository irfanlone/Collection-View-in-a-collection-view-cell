//
//  MainCollectionViewCell.swift
//  Collections-CollectionView
//
//  Created by Irfan Lone on 4/8/16.
//  Copyright © 2016 Ilone Labs. All rights reserved.
//

import UIKit


class MainCollectionViewCell: UICollectionViewCell {
    
    var collectionViewDataSource : ChildCollectionViewDataSource!
    
    
    func initializeCollectionView() {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .Horizontal
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: flowLayout)
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = UIColor.cyanColor()
        collectionView.dataSource = collectionViewDataSource
        
        self.addSubview(collectionView)
        collectionView.reloadData()
    }
    
    
}
