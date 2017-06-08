//
//  SubmitResponseViewController.swift
//  Survey2
//
//  Created by Bradley GIlmore on 6/8/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import UIKit

class SubmitResponseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var responseTextField: UITextField!
    
    //MARK: - IBActions
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        
        guard let name = nameTextField.text, let response = responseTextField.text else { return }
        
        SurveyController.putSurveyWith(name: name, response: response, identifier: UUID().uuidString) { (success) in
            
            if success {
                NSLog("Successfully saved survey")
            } else {
                NSLog("Error saving survey")
            }
            
        }
        
    }
    
    
}
