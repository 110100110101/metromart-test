//
//  ListViewController.swift
//  MetroMart
//
//  Created by Jaja Yting on 2/2/24.
//

import UIKit
import RxSwift
import NVActivityIndicatorView

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var tableView: UITableView!
    
    private let viewModel: ListViewModel
    private let disposeBag = DisposeBag()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bind()
        self.viewModel.getUsers()
    }
    
    override func loadView() {
        
        let view = UIView()
        view.backgroundColor = .orange
        
        self.tableView = UITableView()
        self.tableView.dataSource = self
        self.tableView.delegate = self
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
        
        let user = self.viewModel.users.value[indexPath.row]
        dequeuedCell.setData(user)
        
        return dequeuedCell
    }
    
    // MARK: - UITableViewDelegate Methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let user = self.viewModel.users.value[indexPath.row]
        UIApplication.shared.open(user.profile)
    }
    
    private func bind() {
        
        self.viewModel.isLoading.subscribe(onNext: { isLoading in
            // TODO: Present or hide loading indicatorss
        }).disposed(by: self.disposeBag)
        
        self.viewModel.isErrorEncountered.subscribe(onNext: { isErrorEncountered in
            // TODO: Handle Error
        }).disposed(by: self.disposeBag)
        
        self.viewModel.users.subscribe(onNext: { [weak self] _ in
            self?.tableView.reloadData()
        }).disposed(by: self.disposeBag)
    }
}
