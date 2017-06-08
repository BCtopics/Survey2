//
//  SurveyListViewController.swift
//  Survey2
//
//  Created by Bradley GIlmore on 6/8/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import UIKit

class SurveyListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

    //MARK: - UITableViewDataSource Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SurveyController.surveys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "responseCell", for: indexPath)
        
        let survey = SurveyController.surveys[indexPath.row]
        
        cell.textLabel?.text = survey.username
        cell.detailTextLabel?.text = survey.response
        
        return cell
    }
}
