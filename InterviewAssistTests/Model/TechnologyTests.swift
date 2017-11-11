//
//  TechnologyTests.swift
//  InterviewAssistTests
//
//  Created by YC on 11/7/17.
//  Copyright © 2017 Infosys. All rights reserved.
//

import XCTest

@testable import InterviewAssist

class TechnologyTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_Init_WhenGivenValues_setsName(){
        let technology = Technology(name: "Java", description: "Desc of Java", numberOfQuestions: 12, isStudied: false)
        XCTAssertEqual(technology.name, "Java", "should set name")
    }
    
    func test_Init_WhenGivenValues_setsDescription(){
        let technology = Technology(name: "Java", description: "Desc of Java", numberOfQuestions: 12, isStudied: false)
        XCTAssertEqual(technology.description, "Desc of Java", "should set description")
    }
    
    func test_Init_WhenGivenValues_setsNumberOfQuestions(){
        let technology = Technology(name: "Java", description: "Desc of Java", numberOfQuestions: 12, isStudied: false)
        XCTAssertEqual(technology.numberOfQuestions, 12, "should set numberOfQuestions")
    }
    
    func test_Init_WhenGivenValues_setsIsStudied(){
        let technology = Technology(name: "Java", description: "Desc of Java", numberOfQuestions: 12, isStudied: false)
        XCTAssertEqual(technology.isStudied, false, "should set isStudied")
    }
    
    func test_EqualTechnology_AreEqual(){
        let technology1 = Technology(name: "Java", description: "Desc of Java", numberOfQuestions: 12, isStudied: false)
        let technology2 = Technology(name: "Java", description: "Desc of Java", numberOfQuestions: 12, isStudied: false)
        XCTAssertEqual(technology1, technology2)
    }
    
    func test_Technology_WhenNamesDiffer_AreNotEqual(){
        let technology1 = Technology(name: "Java", description: "Desc of Java", numberOfQuestions: 12, isStudied: false)
        let technology2 = Technology(name: "Python", description: "Desc of Java", numberOfQuestions: 12, isStudied: false)
        XCTAssertNotEqual(technology1, technology2)
    }
    
    func test_Technology_WhenDescriptionsDiffer_AreNotEqual(){
        let technology1 = Technology(name: "Python", description: "Desc of Java", numberOfQuestions: 12, isStudied: false)
        let technology2 = Technology(name: "Python", description: "Desc of Python", numberOfQuestions: 12, isStudied: false)
        XCTAssertNotEqual(technology1, technology2)
    }
    
    func test_Technology_WhenNumberOfQuestionsDiffer_AreNotEqual(){
        let technology1 = Technology(name: "Java", description: "Desc of Java", numberOfQuestions: 12, isStudied: false)
        let technology2 = Technology(name: "Java", description: "Desc of Java", numberOfQuestions: 21, isStudied: false)
        XCTAssertNotEqual(technology1, technology2)
    }
    func test_Technology_WhenIsStudiedDiffer_AreNotEqual(){
        let technology1 = Technology(name: "Java", description: "Desc of Java", numberOfQuestions: 12, isStudied: false)
        let technology2 = Technology(name: "Java", description: "Desc of Java", numberOfQuestions: 12, isStudied: true)
        XCTAssertNotEqual(technology1, technology2)
    }
    func test_Technology_WhenAllDiffer_AreNotEqual(){
        let technology1 = Technology(name: "Java", description: "Desc of Java", numberOfQuestions: 12, isStudied: false)
        let technology2 = Technology(name: "Python", description: "Desc of Python", numberOfQuestions: 21, isStudied: true)
        XCTAssertNotEqual(technology1, technology2)
    }
    
}
