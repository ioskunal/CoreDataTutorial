//
//  ViewController.swift
//  CoreDataTutorial
//
//  Created by Kunal Gupta on 30/05/20.
//  Copyright © 2020 Kunal Gupta. All rights reserved.
//


import UIKit

class ViewController: UIViewController {

    //MARK:- OUTLETS

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!

    //MARK:- VARIABLES

    var indexToEdit: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Save Here"
    }
    
    @IBAction func actionBtnSave(_ sender: Any) {
        let dict = ["name": nameTextField.text ?? "",
                    "mobile": mobileTextField.text ?? "",
                    "email": emailTextField.text ?? "",
                    "city": cityTextField.text ?? ""]

        if let index = indexToEdit {
            CoreDataHelper.shared.editStudent(dict: dict, index: index)
            indexToEdit = nil
        } else {
            CoreDataHelper.shared.saveData(dict: dict)
        }
    }
    
    @IBAction func actionBtnViewList(_ sender: Any) {
        let vc: ListViewController = self.storyboard!.instantiateViewController(identifier: "ListViewController")
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }

}


extension ViewController: PassStudent {

    func studentSelected(_ student: Student, index: Int) {
        nameTextField.text = student.name
        mobileTextField.text = student.mobile
        emailTextField.text = student.email
        cityTextField.text = student.city
        indexToEdit = index
    }

}
