//
//  SurveyController.swift
//  Survey2
//
//  Created by Bradley GIlmore on 6/8/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import Foundation

class SurveyController {
    
    static let baseURL = URL(string: "https://survey-95ee2.firebaseio.com/")
    
    static var surveys: [Survey] = []
    
    //MARK: - Get Request
    

    //MARK: - Put Request
    
    static func putSurveyWith(name: String, response: String, identifier: String, completion: @escaping (Bool) -> Void) {
        
        let survey = Survey(username: name, response: response, identifier: identifier)
        
        guard let endPoint = baseURL?.appendingPathComponent(survey.identifier).appendingPathExtension("json") else { completion(false); return }

        NetworkController.performRequest(for: endPoint, httpMethod: .put, urlParameters: nil, body: survey.jsonData) { (data, error) in
            
            if let error = error { NSLog("Error performing network request for PUT. \(error.localizedDescription)"); completion(false); return }
            
            guard let data = data, let responseDataString = String(data: data, encoding: .utf8) else {
                completion(false); NSLog("Data is nil"); return
            }
            
            if responseDataString.contains("error") {
                NSLog("Error: \(responseDataString)")
                completion(false)
                return
            } else {
                NSLog("Successfully saved survey to endpoint \(responseDataString)")
                completion(true)
            }
        }
    }
    
// End
}
// End
