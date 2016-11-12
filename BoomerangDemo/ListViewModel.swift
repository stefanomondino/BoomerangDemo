//
//  ShowListViewModel.swift
//  BoomerangDemo
//
//  Created by Stefano Mondino on 11/11/16.
//  Copyright © 2016 Stefano Mondino. All rights reserved.
//

import Foundation
import Boomerang
import ReactiveSwift
import ReactiveCocoa

class ListViewModel : ListViewModelType {
    var reloadAction: Action<ResultRangeType?, ModelStructure, NSError> = Action {_ in return SignalProducer(value:ModelStructure.empty)}
    var models:MutableProperty<ModelStructure> = MutableProperty(ModelStructure.empty)
    var viewModels:MutableProperty = MutableProperty([IndexPath:ItemViewModelType]())
    var isLoading:MutableProperty<Bool> = MutableProperty(false)
    var resultsCount:MutableProperty<Int> = MutableProperty(0)
    var newDataAvailable:MutableProperty<ResultRangeType?> = MutableProperty(nil)
    func select(selection: SelectionType) -> ViewModelType {
        return self
    }
    func itemViewModel(_ model: ModelType) -> ItemViewModelType? {
        return nil
    }
    func listIdentifiers() -> [ListIdentifier] {
        return []
    }
    required init() {}
}
