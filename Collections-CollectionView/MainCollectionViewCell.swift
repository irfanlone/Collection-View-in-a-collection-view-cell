//
//  MainCollectionViewCell.swift
//  Collections-CollectionView
//
//  Created by Irfan Lone on 4/8/16.
//  Copyright © 2016 Ilone Labs. All rights reserved.
//

import UIKit

protocol CollectionViewSelectedProtocol {
    
    func collectionViewSelected(_ collectionViewItem : Int)

}

class MainCollectionViewCell: UICollectionViewCell {
        
    var collectionViewDataSource : UICollectionViewDataSource!
    
    var collectionViewDelegate : UICollectionViewDelegate!
    
    var collectionView : UICollectionView!
    
    var delegate : CollectionViewSelectedProtocol!
    
    var collectionViewOffset: CGFloat {
        set {
            collectionView.contentOffset.x = newValue
        }
        
        get {
            return collectionView.contentOffset.x
        }
    }
    
    func initializeCollectionViewWithDataSource<D: UICollectionViewDataSource,E: UICollectionViewDelegate>(_ dataSource: D, delegate :E, forRow row: Int) {
        
        self.collectionViewDataSource = dataSource
        
        self.collectionViewDelegate = delegate
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: flowLayout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseChildCollectionViewCellIdentifier)
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self.collectionViewDataSource
        collectionView.delegate = self.collectionViewDelegate
        collectionView.tag = row
        
        self.addSubview(collectionView)
        
        self.collectionView = collectionView
        
        var frame = self.bounds
        frame.size.width = 80
        frame.size.height = 25
        
        let button = UIButton(frame: frame)
        button.setTitle("Details >", for: UIControlState())
        button.setTitleColor(UIColor.purple, for: UIControlState())
        button.titleLabel?.font = UIFont(name: "Gillsans", size: 14)
        button.addTarget(self, action: #selector(MainCollectionViewCell.buttonAction(_:)), for: UIControlEvents.touchUpInside)
        self.addSubview(button)

        collectionView.reloadData()
    }
    
    func buttonAction(_ sender: UIButton!) {
        self.delegate.collectionViewSelected(collectionView.tag)
    }
    
}

