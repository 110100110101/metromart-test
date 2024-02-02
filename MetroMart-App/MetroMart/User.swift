//
//  User.swift
//  MetroMart-App
//
//  Created by Jaja Yting on 2/2/24.
//

import Foundation

struct User {
    
    var username: String
    var avatar: URL
    var profile: URL
}

extension User: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        
        case username = "login"
        case avatar = "avatar_url"
        case profile = "html_url"
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Username
        
        self.username = try container.decode(String.self, forKey: .username)
        
        // Avatar
        
        if let parsedAvatarReadableURL = try? container.decode(String.self, forKey: .avatar),
           let parsedAvatarURL = URL(string: parsedAvatarReadableURL) {
            self.avatar = parsedAvatarURL
        }
        else {
            throw DecodingError.dataCorrupted(.init(codingPath: [CodingKeys.avatar], debugDescription: "Corrupted avatar URL"))
        }
        
        // Profile
        
        if let parsedProfileReadableURL = try? container.decode(String.self, forKey: .profile),
           let parsedProfileURL = URL(string: parsedProfileReadableURL) {
            self.profile = parsedProfileURL
        }
        else {
            throw DecodingError.dataCorrupted(.init(codingPath: [CodingKeys.avatar], debugDescription: "Corrupted profiles URL"))
        }
    }
}
