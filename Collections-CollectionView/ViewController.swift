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
    var data : AnyObject!
    var dataProvider : MainCollectionViewDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        data  = [ ["","","",""],
                  ["","","",""],
                  ["","","","","","","","","","","",""],
                  ["","","","","","","","","","","",""],
                  ["","","","","","","","","","","",""],
                  ["","","","","","","","","","","","","","","",""],
                  ["","","",""],
                  ["","","","","","","","","","","",""],
                  ["","","","","","","","","","","",""],
                  ["","","","","","","","","","","",""],
                  ["","","","","","","","","","","","","","","",""]
        ]
        
        dataProvider = MainCollectionViewDataSource()
        dataProvider.data = data as! NSArray
        collectionView.dataSource = dataProvider
        
    }
    

}


extension ViewController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        guard let cell = cell as? MainCollectionViewCell else { return }
        let dataProvider = ChildCollectionViewDataSource()
        dataProvider.data = data[indexPath.row] as! NSArray
        cell.collectionViewDataSource = dataProvider
        cell.initializeCollectionView()
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(self.view.frame.size.width, 100)
    }
    
}
