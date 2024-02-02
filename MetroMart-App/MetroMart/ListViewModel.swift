//
//  ListViewModel.swift
//  MetroMart
//
//  Created by Jaja Yting on 2/2/24.
//

import Foundation
import RxRelay

protocol UserProvider {
    
    func getUsers(completion: @escaping ([User]?) -> ())
}

class ListViewModel {
    
    let isLoading = PublishRelay<Bool>()
    let isErrorEncountered = PublishRelay<Bool>()
    let users = BehaviorRelay<[User]>(value: [])
    
    private let provider: UserProvider
    
    init(provider: UserProvider) {
        self.provider = provider
    }
    
    func getUsers() {
        
        self.isLoading.accept(true)
        
        self.provider.getUsers { [weak self] fetchedUsers in
            
            guard let fetchedUsers = fetchedUsers else {
                self?.isLoading.accept(false)
                self?.isErrorEncountered.accept(true)
                return
            }
            
            self?.users.accept(fetchedUsers)
        }
    }
}
