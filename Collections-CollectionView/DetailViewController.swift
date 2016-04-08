//
//  DetailViewController.swift
//  Collections-CollectionView
//
//  Created by Irfan Lone on 4/8/16.
//  Copyright © 2016 Ilone Labs. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var dataSource : UICollectionViewDataSource!
    var delegate : UICollectionViewDelegate!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = dataSource
        collectionView.delegate = delegate
        
    }
    
}
