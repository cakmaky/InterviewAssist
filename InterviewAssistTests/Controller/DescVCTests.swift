//
//  DescVCTests.swift
//  InterviewAssistTests
//
//  Created by YC on 11/9/17.
//  Copyright © 2017 Infosys. All rights reserved.
//

import XCTest
import UIKit

@testable import InterviewAssist

class DescVCTests: XCTestCase {
    var sut:DescVC!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "DescVC") as! DescVC
        sut.technology = Technology(name: "Java", description: "Desc of Java", numberOfQuestions: 13, isStudied: false)
        _ = sut.view
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_HasTextView(){
        
        XCTAssertNotNil(sut.textView)
    }
    
    func test_TechnologyDescription(){

        XCTAssertEqual(sut.textView.text, "Desc of Java")
    }
}
