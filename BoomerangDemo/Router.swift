//
//  Router.swift
//  BoomerangDemo
//
//  Created by Stefano Mondino on 11/11/16.
//  Copyright © 2016 Stefano Mondino. All rights reserved.
//

import Foundation
import Boomerang
import UIKit

enum Storyboard : String {
    case main = "Main"
    
    func scene(identifier:SceneIdentifier) -> UIViewController {
        return UIStoryboard(name: self.rawValue, bundle: nil).instantiateViewController(withIdentifier: identifier.rawValue)
    }
}
enum SceneIdentifier : String {
    case showList = "showList"
    case showDetail = "showDetail"
}

enum View : String, ListIdentifier {
    case showItem = "ShowItemCollectionViewCell"
    
    static func all() -> [View] {
        return [.showItem]
    }
    var name: String {return self.rawValue}
    var type: String? {return nil}
}

struct Router : RouterType {
    public static func from<Source,DestinationViewModel> (_ source:Source, viewModel:DestinationViewModel)  -> RouterAction
    where
    Source : ShowListViewController{
        let destination = Storyboard.main.scene(identifier: .showDetail)
        (destination as? ShowDetailViewController)?.bindViewModelAfterLoad(viewModel as? ViewModelType)
        return UIViewControllerRouterAction.push(source: source, destination: destination)
        
    }
    
    public static func root() -> UIViewController {
        let source = Storyboard.main.scene(identifier: .showList)
        (source as! ShowListViewController).bindViewModelAfterLoad(ViewModelFactory.showListViewModel())
        return UINavigationController(rootViewController: source)
    }
    
}
