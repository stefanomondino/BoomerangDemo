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
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let provider = ReactiveCocoaMoyaProvider<TVMaze>()
        provider.request(token: .search("lost")).mapArray(type: Movie.self).start { event in
            switch event {
            case let .value(array):
                let img = array.first?.imageURL
                provider.request(token: .image(img!)).mapImage().start {event in
                
                }
                
            case let .failed(error):
                print (error)
                break
            default: break
            }
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

