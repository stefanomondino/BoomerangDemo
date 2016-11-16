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

private extension UIUserInterfaceIdiom {
    func showListLineItemCount() -> Int {
        switch self {
        case .phone:
            return 2
        case .pad:
            return 4    
        case .tv:
            return 6
        default:
            return 2
        }
    }
}

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
        flow?.sectionInset = UIEdgeInsetsMake(80, 10, 30, 10)
        flow?.minimumInteritemSpacing = 10
        flow?.minimumLineSpacing = 10
    
        vm.queryString <~ self.txt_query!.reactive.continuousTextValues.skipNil()
        
        vm.reload()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        //self.collectionView?.collectionViewLayout.invalidateLayout()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.autosizeItemAt(indexPath: indexPath, itemsPerLine: UIDevice.current.userInterfaceIdiom.showListLineItemCount())
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Router.from(self, viewModel: self.viewModel?.select(selection: indexPath)).execute()
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animateAlongsideTransition(in: self.view, animation: {[weak self] (_) in
            self?.collectionView?.collectionViewLayout.invalidateLayout()
        }, completion:nil)
    }
}

