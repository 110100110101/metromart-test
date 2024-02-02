//
//  GithubTarget.swift
//  MetroMart-App
//
//  Created by Jaja Yting on 2/2/24.
//

import Foundation
import Moya

enum GithubTarget: TargetType {
 
    case users
    
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }

    var path: String {
        
        switch self {
        case .users:
            return "/users"
        }
    }

    var method: Moya.Method {
        switch self {
        case .users:
            return .get
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case .users:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        return nil
    }
}
