//
//  ViewController.swift
//  Collections-CollectionView
//
//  Created by Irfan Lone on 4/8/16.
//  Copyright © 2016 Ilone Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let data = generateRandomData()
    var dataProvider : MainCollectionViewDataSource!
    var storedOffsets = [Int: CGFloat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataProvider = MainCollectionViewDataSource()
        dataProvider.data = data
        collectionView.dataSource = dataProvider
    }

}


extension ViewController : UICollectionViewDelegate {
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        guard let collectionViewCell = cell as? MainCollectionViewCell else { return }
        
        let dataProvider = ChildCollectionViewDataSource()
        dataProvider.data = data[indexPath.row] as NSArray
        
        let delegate = ChildCollectionViewDelegate()
        
        collectionViewCell.initializeCollectionViewWithDataSource(dataProvider, delegate: delegate, forRow: indexPath.row)
        
        collectionViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, didEndDisplayingCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        guard let collectionViewCell = cell as? MainCollectionViewCell else { return }
        storedOffsets[indexPath.row] = collectionViewCell.collectionViewOffset
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("\(indexPath.row)")
    }
}

extension ViewController : UICollectionViewDelegateFlowLayout {
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(self.view.frame.size.width, 108)
    }
}


