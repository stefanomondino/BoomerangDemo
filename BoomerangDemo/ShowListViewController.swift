//
//  ViewController.swift
//  BoomerangDemo
//
//  Created by Stefano Mondino on 11/11/16.
//  Copyright © 2016 Stefano Mondino. All rights reserved.
//

import UIKit
import Moya
import ReactiveCocoa
import Boomerang

class ShowListViewController: UIViewController, ViewModelBindable , UICollectionViewDelegateFlowLayout{

    var viewModel: ViewModelType?
    
    @IBOutlet weak var collectionView:UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel(ViewModelFactory().showListViewModel())
        
    }
    func bindViewModel(_ viewModel: ViewModelType?) {
        guard let vm = viewModel as? ListViewModel else {
            return
        }
        self.viewModel = vm
        self.collectionView?.delegate = self
        self.collectionView?.bindViewModel(vm)
        vm.reload()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height: 44)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

