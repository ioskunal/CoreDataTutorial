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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Save Here"
    }
    
    @IBAction func actionBtnSave(_ sender: Any) {
        let dict = ["name": nameTextField.text ?? "",
                    "mobile": mobileTextField.text ?? "",
                    "email": emailTextField.text ?? "",
                    "city": cityTextField.text ?? ""]
        CoreDataHelper.shared.saveData(dict: dict)
    }
    
    @IBAction func actionBtnViewList(_ sender: Any) {
        let vc: ListViewController = self.storyboard!.instantiateViewController(identifier: "ListViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }

}


