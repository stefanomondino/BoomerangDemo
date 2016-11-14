//
//  ShowDetailViewController.swift
//  BoomerangDemo
//
//  Created by Stefano Mondino on 14/11/16.
//  Copyright © 2016 Stefano Mondino. All rights reserved.
//

import UIKit
import Boomerang

class ShowDetailViewController: UIViewController , ViewModelBindable, UICollectionViewDelegateFlowLayout {
    var viewModel: ShowDetailViewModel?
    @IBOutlet weak var collectionView:UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    func bindViewModel(_ viewModel: ViewModelType?) {
        guard let vm = viewModel as? ShowDetailViewModel else {
            return
        }
        
        self.viewModel = vm
        self.title = vm.title
        self.collectionView?.delegate = self
        self.collectionView?.bindViewModel(vm)
        vm.reload()
        let flow = self.collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
        flow?.sectionInset = UIEdgeInsetsMake(80, 0, 30, 0)
        flow?.minimumInteritemSpacing = 0
        flow?.minimumLineSpacing = 0
    }
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height: 300)
    }
}
