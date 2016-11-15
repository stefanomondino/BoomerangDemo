//
//  ShowDetailViewModel.swift
//  BoomerangDemo
//
//  Created by Stefano Mondino on 14/11/16.
//  Copyright © 2016 Stefano Mondino. All rights reserved.
//

import Foundation
import ReactiveSwift
import Boomerang


final class ShowDetailViewModel : ListViewModelType, ItemViewModelType {
    var dataHolder: ListDataHolderType = ListDataHolder.empty
    var model: ItemViewModelType.Model = Show.placeholder!
    var itemIdentifier: ListIdentifier = ""
    var title:String?
    init() {}
    convenience init(model:Show) {
        self.init(model: model as ModelType)
        self.model = model
        self.title = model.title
        self.dataHolder = ListDataHolder(dataProducer: model.detail.map {ModelStructure([
            ShowItemViewModel(model: $0)
            ])})
    }
    func itemViewModel(_ model: ModelType) -> ItemViewModelType? {
        return model as? ItemViewModelType
    }
//
    func listIdentifiers() -> [ListIdentifier] {
        return View.all()
    }
    func select(selection: SelectionType) -> ViewModelType {
        return self
    }
    
}
