//
//  ConcreteUseProvider.swift
//  MetroMart-App
//
//  Created by Jaja Yting on 2/2/24.
//

import Foundation
import Moya

class ConcreteProvider: UserProvider {
    
    private let provider = MoyaProvider<GithubTarget>()
    
    func getUsers(completion: @escaping ([User]?) -> ()) {
        
        self.provider.request(.users) { result in
            
            switch result {
                
            case .success(let response):
                
                do {
                    
                    let filteredResponse = try response.filterSuccessfulStatusCodes()
                    let decodedUsers = try JSONDecoder().decode([User].self, from: filteredResponse.data)
                    completion(decodedUsers)
                }
                catch {
                    completion(nil)
                }
                
            case .failure:
                completion(nil)
            }
        }
    }
}
