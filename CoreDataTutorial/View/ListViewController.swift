//
//  ListViewController.swift
//  CoreDataTutorial
//
//  Created by Kunal Gupta on 30/05/20.
//  Copyright © 2020 Kunal Gupta. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    //MARK:- OUTLETS

    @IBOutlet weak var tableViewResults: UITableView!

    //MARK:- VARIABLES

    var arrStudents = [Student]()
    
    //MARK:- LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrStudents = CoreDataHelper.shared.fetchAllStudents()
        print(arrStudents)
        tableViewResults.reloadData()
    }

}


extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrStudents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell") as? ItemTableViewCell else {return UITableViewCell()}
        let student = arrStudents[indexPath.row]
        cell.nameLabel.text = student.name
        cell.mobileLabel.text = student.mobile
        cell.emailLabel.text = student.email
        cell.cityLabel.text = student.city
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }

}

