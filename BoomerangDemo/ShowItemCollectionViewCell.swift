//
//  ShowItemCollectionViewCell.swift
//  BoomerangDemo
//
//  Created by Stefano Mondino on 12/11/16.
//  Copyright © 2016 Stefano Mondino. All rights reserved.
//

import UIKit
import Boomerang
import ReactiveCocoa
import ReactiveSwift

class ShowItemCollectionViewCell: UICollectionViewCell, ViewModelBindable {
    var viewModel: ViewModelType?
    var disposable: CompositeDisposable?
    @IBOutlet weak var lbl_title:UILabel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func bindViewModel(_ viewModel: ViewModelType?) {
        guard let vm = viewModel as? ShowItemViewModel else {
            return
        }
        self.lbl_title?.text = vm.title
    }
}
