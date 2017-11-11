//
//  TechManagerTests.swift
//  InterviewAssistTests
//
//  Created by YC on 11/7/17.
//  Copyright © 2017 Infosys. All rights reserved.
//

import XCTest

@testable import InterviewAssist

class TechManagerTests: XCTestCase {
    
    var sut:TechManager!
    
    override func setUp() {
        super.setUp()
        sut = TechManager()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_TechnologiesCount_Initially_isZero(){
        XCTAssertEqual(sut.getCount(), 0)
    }
    
    func test_AddTechnology_IncreasesTechnologiesCountToOne(){
        let technology = Technology(name: "Java", description: "Desc of Java", numberOfQuestions: 12, isStudied: false)
        sut.add(technology: technology)
        XCTAssertEqual(sut.getCount(), 1)
    }
    
    func test_AfterAddTechnology_ReturnsThatTechnology(){
        let technology = Technology(name: "Python", description: "Desc of Python", numberOfQuestions: 18, isStudied: true)
        sut.add(technology: technology)
        
        let returnedTechnology = sut.technology(at: 0)
        XCTAssertEqual(returnedTechnology.name, technology.name)
    }
    
    func test_AddTechnology_AndRemoveIt_MakesCountZero(){
        let technology = Technology(name: "Python", description: "Desc of Python", numberOfQuestions: 18, isStudied: true)
        sut.add(technology: technology)
        
        sut.remove(technology: technology)
        XCTAssertEqual(sut.getCount(), 0)
    }
    
    func test_RemoveFirstTechnology_MakesSecondFirst(){
        let technology1 = Technology(name: "Python", description: "Desc of Python", numberOfQuestions: 18, isStudied: true)
        let technology2 = Technology(name: "Java", description: "Desc of Java", numberOfQuestions: 12, isStudied: false)
        
        sut.add(technology: technology1)
        sut.add(technology: technology2)
        
        sut.remove(technology: technology1)
        XCTAssertEqual(sut.technology(at: 0).name, "Java")
    }
    
    func test_RemoveUnavailableTechnology_DoesNotRemoveAnyTechnology(){
        let technology1 = Technology(name: "Python", description: "Desc of Python", numberOfQuestions: 18, isStudied: true)
        let technology2 = Technology(name: "Java", description: "Desc of Java", numberOfQuestions: 12, isStudied: false)
        let technology3 = Technology(name: "Swift", description: "Desc of Swift", numberOfQuestions: 14, isStudied: false)
     
        sut.add(technology: technology1)
        sut.add(technology: technology2)
        sut.remove(technology: technology3)
        
        XCTAssertEqual(sut.getCount(), 2)
    }
    
    func test_TryToAddTheSameTechnology_DoesNotIncreaseCount(){
        let technology = Technology(name: "Python", description: "Desc of Python", numberOfQuestions: 18, isStudied: true)
        sut.add(technology: technology)
        sut.add(technology: technology)
        
        XCTAssertEqual(sut.getCount(), 1)
    }
    
    func test_RemoveAll_ReturnsCountZero(){
        let technology1 = Technology(name: "Python", description: "Desc of Python", numberOfQuestions: 18, isStudied: true)
        let technology2 = Technology(name: "Java", description: "Desc of Java", numberOfQuestions: 12, isStudied: false)
        let technology3 = Technology(name: "Swift", description: "Desc of Swift", numberOfQuestions: 14, isStudied: false)
        
        sut.add(technology: technology1)
        sut.add(technology: technology2)
        sut.add(technology: technology3)
        
        XCTAssertEqual(sut.getCount(), 3)
        sut.removeAll()
        XCTAssertEqual(sut.getCount(), 0)
    }
}








