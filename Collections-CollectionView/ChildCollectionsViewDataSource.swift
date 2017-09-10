//
//  MainCollectionsViewDataSource.swift
//  Collections-CollectionView
//
//  Created by Irfan Lone on 4/8/16.
//  Copyright © 2016 Ilone Labs. All rights reserved.
//

import UIKit

class ChildCollectionViewDataSource : NSObject, UICollectionViewDataSource {
    
    var data : NSArray!
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseChildCollectionViewCellIdentifier, for: indexPath)
        
        cell.backgroundColor = data[indexPath.row] as? UIColor
        
        return cell
    }
    
}
