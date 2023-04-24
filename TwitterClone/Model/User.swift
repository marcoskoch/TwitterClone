//
//  User.swift
//  TwitterClone
//
//  Created by Marcos Michel on 24/04/23.
//

import Foundation

struct User {
    let uid: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: URL?
    
    init(uid: String, dictionary: [String: AnyObject]) {
        self.uid = uid
        
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        
        if let profileImageUrlString = dictionary["profileImageUrl"] as? String {
            guard let url = URL(string: profileImageUrlString) else { return }
            self.profileImageUrl = url
        }
    }
    
}
