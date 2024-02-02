//
//  ListViewController.swift
//  MetroMart
//
//  Created by Jaja Yting on 2/2/24.
//

import UIKit

class ListViewController: UIViewController {
    
    private let viewModel: ListViewModel
    
    convenience init() {
        fatalError("Use the designated initializer init(viewModel:)!")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented, so use init(viewModel:)!")
    }
    
    init(viewModel: ListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
}
