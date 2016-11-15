//
//  ViewModelFactory.swift
//  BoomerangDemo
//
//  Created by Stefano Mondino on 12/11/16.
//  Copyright © 2016 Stefano Mondino. All rights reserved.
//

import Foundation
import ReactiveSwift
import Moya
import Boomerang
struct ViewModelFactory {
    static func showListViewModel() -> ViewModelType {
        return ShowListViewModel()
    }
    static func showDetailViewModel(model:Show) -> ViewModelType {
        return ShowDetailViewModel(model: model)
    }
}
