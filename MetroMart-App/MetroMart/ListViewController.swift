//
//  ListViewController.swift
//  MetroMart
//
//  Created by Jaja Yting on 2/2/24.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource {
    
    private var tableView: UITableView!
    
    private let viewModel: ListViewModel
    
    // MARK: - Initializers
    
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
    
    // MARK: View Lifecycles
    
    override func loadView() {
        
        let view = UIView()
        view.backgroundColor = .orange
        
        self.tableView = UITableView()
        self.tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "UserTableViewCell")
        self.tableView.estimatedRowHeight = 32.0
        self.tableView.rowHeight = UITableView.automaticDimension
        
        view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        self.view = view
    }
    
    // MARK: - UITableViewDataSource Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.users.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        
        return dequeuedCell
    }
}
