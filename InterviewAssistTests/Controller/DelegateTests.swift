//
//  DelegateTests.swift
//  InterviewAssistTests
//
//  Created by YC on 11/12/17.
//  Copyright © 2017 Infosys. All rights reserved.
//

import XCTest
import UIKit

@testable import InterviewAssist

class DelegateTests: XCTestCase{
    
    var firstVC:FirstVC!
    var inputVC:InputVC!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        firstVC = storyboard.instantiateViewController(withIdentifier: "FirstVC") as! FirstVC
        inputVC = storyboard.instantiateViewController(withIdentifier: "InputVC") as! InputVC
        
        inputVC.delegate = firstVC
        
        _ = firstVC.view
        _ = inputVC.view
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_AddTechnologyToTheList_SouldAddTechnologyToFirstVC(){
        inputVC.nameField.text = "Python"
        inputVC.numberOfQuestionsField.text = "12"
        inputVC.descriptionField.text = "Description of Python"
        inputVC.isStudiedSwitch.isOn = true

        inputVC.AddTechnologyToTheList()

        let count = firstVC.techManager.getCount()
        XCTAssertEqual(count, 1)

        let retrievedTechnology = firstVC.techManager.technology(at: 0)
        XCTAssertEqual(retrievedTechnology.name, "Python")
        XCTAssertEqual(retrievedTechnology.description, "Description of Python")
        XCTAssertEqual(retrievedTechnology.numberOfQuestions, 12)
        XCTAssertTrue(retrievedTechnology.isStudied)
    }
    
    func test_AddTechnologyToTheList_SouldFailToAddTechnologyToFirstVC(){
        inputVC.nameField.text = nil
        inputVC.numberOfQuestionsField.text = nil
        inputVC.descriptionField.text = nil
        inputVC.isStudiedSwitch.isOn = true
        
        inputVC.AddTechnologyToTheList()
        
        let count = firstVC.techManager.getCount()
        XCTAssertEqual(count, 0)
    }
}
