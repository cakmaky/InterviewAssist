//
//  InputVC.swift
//  InterviewAssist
//
//  Created by YC on 11/7/17.
//  Copyright © 2017 Infosys. All rights reserved.
//

import UIKit

protocol Delegate {
    func getTechnology(technology:Technology)
}

class InputVC: UIViewController {
    
    var delegate: Delegate?
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var numberOfQuestionsField: UITextField!
    @IBOutlet weak var isStudiedSwitch: UISwitch!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.clearFields()
    }
    
    func clearFields(){
        self.nameField.text = ""
        self.numberOfQuestionsField.text = ""
        self.descriptionField.text = ""
        self.isStudiedSwitch.isOn = false
    }
    
    func checkActionForButton(_ button: UIButton?, actionName: String, event: UIControlEvents = UIControlEvents.touchUpInside, target: UIViewController) -> Bool {
        
        if let unwrappedButton = button, let actions = unwrappedButton.actions(forTarget: target, forControlEvent: event) {
            
            var testAction = actionName
            if let trimmedActionName = actionName.components(separatedBy: ":").first {
                testAction = trimmedActionName
            }
            
            return (!actions.filter { $0.contains(testAction) }.isEmpty)
        }
        
        return false
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
       self.AddTechnologyToTheList()
    }
    
    func AddTechnologyToTheList(){
        let name = nameField.text
        let numberOfQuestionsString = numberOfQuestionsField.text
        let numberOfQuestionsInt = Int(numberOfQuestionsString ?? "0")
        let isStudied = isStudiedSwitch.isOn
        let description = descriptionField.text
        
        if let nm = name, let noq = numberOfQuestionsInt,let desc = description {
            let technology = Technology(name: nm, description: desc, numberOfQuestions: noq, isStudied: isStudied)
            delegate?.getTechnology(technology: technology)
            
            let alert = UIAlertController(title: "Success", message: "Technology added sucessfully", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title:"Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated:true,completion: nil)
            
        } else {
            let alert = UIAlertController(title: "Fail", message: "Please fill all fields to save a technology!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title:"Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated:true,completion: nil)
        }
    }
}

