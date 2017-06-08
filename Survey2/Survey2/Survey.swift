//
//  Survey.swift
//  Survey2
//
//  Created by Bradley GIlmore on 6/8/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import Foundation

class Survey {
    
    //MARK: - Internal Properties
    
    let username: String
    let response: String
    let identifier: String
    
    //MARK: - Initializers
    
    init(username: String, response: String, identifier: String) {
        self.username = username
        self.response = response
        self.identifier = identifier
    }
    
    init?(dictionary: [String: Any], identifier: String) {
        
        guard let username = dictionary[usernameKey] as? String,
            let response = dictionary[responseKey] as? String else { return nil }
        
        self.username = username
        self.response = response
        self.identifier = identifier
    }
    
    //MARK: - Keys
    
    private let usernameKey = "username"
    private let responseKey = "response"
    
    //MARK: - JSON 
    
    var dictionaryRepresentation: [String: Any] {
        return [usernameKey: username, responseKey: response]
    }
    
    var jsonData: Data? {
        return try? JSONSerialization.data(withJSONObject: dictionaryRepresentation, options: .prettyPrinted)
    }
    
}












