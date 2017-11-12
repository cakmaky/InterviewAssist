//
//  InputVCTests.swift
//  InterviewAssistTests
//
//  Created by YC on 11/9/17.
//  Copyright © 2017 Infosys. All rights reserved.
//

import XCTest
import UIKit

@testable import InterviewAssist

class InputVCTests: XCTestCase {
    
    var sut:InputVC!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "InputVC") as! InputVC
        
        _ = sut.view
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_HasNameField(){
        
        XCTAssertNotNil(sut.nameField)
    }
    
    func test_HasNumberOfQuestionsField(){
        
        XCTAssertNotNil(sut.numberOfQuestionsField)
    }
    
    func test_HasIsStudiedSwitch(){
        
        XCTAssertNotNil(sut.isStudiedSwitch)
    }
    
    func test_HasDescriptionField(){
        
        XCTAssertNotNil(sut.descriptionField)
    }
    
    func test_HasSaveButton(){
        
        XCTAssertNotNil(sut.saveButton)
    }
    
    func test_HasCancelButton(){
        
        XCTAssertNotNil(sut.cancelButton)
    }
    
    func test_CancelButtonIsConnected() {
        XCTAssertTrue(sut.checkActionForButton(sut.cancelButton, actionName: "cancelButtonTapped", event:UIControlEvents.touchUpInside, target: sut))
    }
    
    func test_ClearFields_ClearsAllFields(){
        sut.nameField.text = "Python"
        sut.numberOfQuestionsField.text = "12"
        sut.descriptionField.text = "Description of Python"
        sut.isStudiedSwitch.isOn = true
        sut.clearFields()
        
        XCTAssertEqual(sut.nameField.text, "")
        XCTAssertEqual(sut.numberOfQuestionsField.text, "")
        XCTAssertEqual(sut.descriptionField.text, "")
        XCTAssertFalse(sut.isStudiedSwitch.isOn)
    }
}







