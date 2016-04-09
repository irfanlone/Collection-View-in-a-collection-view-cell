//
//  ChildCollectionViewDelegate.swift
//  Collections-CollectionView
//
//  Created by Irfan Lone on 4/8/16.
//  Copyright © 2016 Ilone Labs. All rights reserved.
//

import UIKit


class ChildCollectionViewDelegate: NSObject, UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("cell no: \(indexPath.row) of collection view: \(collectionView.tag)")
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(85, 85)
    }
    
}

