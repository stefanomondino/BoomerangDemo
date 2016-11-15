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
import Result
class ShowListViewController: UIViewController, ViewModelBindable , UICollectionViewDelegateFlowLayout{

    var viewModel: ListViewModelType?
    @IBOutlet weak var txt_query:UITextField?
    @IBOutlet weak var collectionView:UICollectionView?
    var disposable: CompositeDisposable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func bindViewModel(_ viewModel: ViewModelType?) {
        guard let vm = viewModel as? ShowListViewModel else {
            return
        }
        self.viewModel = vm
        self.collectionView?.delegate = self
        self.collectionView?.bindViewModel(vm)
        
        let flow = self.collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
        flow?.sectionInset = UIEdgeInsetsMake(80, 0, 30, 0)
        flow?.minimumInteritemSpacing = 0
        flow?.minimumLineSpacing = 0
    
        vm.queryString <~ self.txt_query!.reactive.continuousTextValues.skipNil().logEvents()
        
        vm.reload()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width/2, height: 300)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Router.from(self, viewModel: self.viewModel?.select(selection: indexPath)).execute()
    }


}

