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
}







