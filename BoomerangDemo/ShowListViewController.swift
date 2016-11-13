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
import ReactiveSwift
import Boomerang

class ShowListViewController: UIViewController, ViewModelBindable , UICollectionViewDelegateFlowLayout{

    var viewModel: ViewModelType?
    @IBOutlet weak var txt_query:UITextField?
    @IBOutlet weak var collectionView:UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel(ViewModelFactory().showListViewModel())
        
    }
    func bindViewModel(_ viewModel: ViewModelType?) {
        guard let vm = viewModel as? ShowListViewModel else {
            return
        }
        self.viewModel = vm
        self.collectionView?.delegate = self
        self.collectionView?.bindViewModel(vm)
        vm.reload()
        let flow = self.collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
        flow?.sectionInset = UIEdgeInsetsMake(80, 0, 30, 0)
         //self.txt_query?.reactive.text <~ vm.queryString.producer.skipRepeats()
        vm.queryString <~ self.txt_query!.reactive.continuousTextValues.skipNil()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height: 44)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

