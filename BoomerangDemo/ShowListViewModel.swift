//
//  ShowListViewModel.swift
//  BoomerangDemo
//
//  Created by Stefano Mondino on 12/11/16.
//  Copyright © 2016 Stefano Mondino. All rights reserved.
//

import UIKit
import ReactiveSwift
import Boomerang
import Result



final class ShowListViewModel: ListViewModelType {
    var dataHolder: ListDataHolderType = ListDataHolder.empty
    let queryString = MutableProperty<String>("")
    
    func select(selection: SelectionType) -> ViewModelType {
        guard let indexPath = selection as? IndexPath else {
            return self
        }
        let show = self.modelAtIndex(indexPath) as! Show
        return ViewModelFactory.showDetailViewModel(model:show)
        
    }
    init() {
        self.dataHolder = ListDataHolder(dataProducer:
            SignalProducer<String,NoError>(value:"")
                .flatMap(.latest) {[weak self] _ in  return Show.query(self?.queryString.value ?? "").map {array in ModelStructure(array)}}
        
        )
        
        self.queryString.producer.debounce(0.5, on: QueueScheduler.main).startWithResult { (result) in
            self.reload()
        }
        
    }
    func listIdentifiers() -> [ListIdentifier] {
        return View.all()
    }
    
    func itemViewModel(_ model: ModelType) -> ItemViewModelType? {
        return ShowItemViewModel(model: model)
    }
}
