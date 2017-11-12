//
//  FirstVCTests.swift
//  InterviewAssistTests
//
//  Created by YC on 11/9/17.
//  Copyright © 2017 Infosys. All rights reserved.
//

import XCTest
import UIKit

@testable import InterviewAssist
class FirstVCTests: XCTestCase {
    
    var sut:FirstVC!
    var tableView:UITableView!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "FirstVC") as! FirstVC
        _ = sut.view
        
        sut.techManager = TechManager()
        tableView = sut.tableView
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSUT_TableViewIsNotNilAfterViewDidLoad() {
        
        XCTAssertNotNil(tableView)
    }
    func testSUT_ShouldSetTableViewDelegate() {
        
        XCTAssertNotNil(tableView.delegate)
    }
    
    func testSUT_ShouldSetTableViewDataSource() {
        
        XCTAssertNotNil(tableView.dataSource)
    }
    
    func testSUT_ConformsToTableViewDelegateProtocol() {
        
        XCTAssert(sut.conforms(to: UITableViewDelegate.self))
        XCTAssert(sut.responds(to: #selector(sut.tableView(_:didSelectRowAt:))))
    }
    
    func testSUT_ConformsToTableViewDataSourceProtocol() {
        
        XCTAssert(sut.conforms(to: UITableViewDataSource.self))
        XCTAssert(sut.responds(to: #selector(sut.numberOfSections(in:))))
        XCTAssert(sut.responds(to: #selector(sut.tableView(_:numberOfRowsInSection:))))
        XCTAssert(sut.responds(to: #selector(sut.tableView(_:cellForRowAt:))))
    }
    
    func test_NumberOfSections_IsOne(){
        let numberOfSections = tableView.numberOfSections
        XCTAssertEqual(numberOfSections, 1)
    }
    
    func test_NumberOfRowsInSection(){
        let technology1 = Technology(name: "Python", description: "Desc of Python", numberOfQuestions: 18, isStudied: true)
        sut.techManager.add(technology: technology1)
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        
        let technology2 = Technology(name: "Java", description: "Desc of Java", numberOfQuestions: 12, isStudied: false)
        sut.techManager.add(technology: technology2)
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }
    
    func test_cellForRow_ReturnsTechCell(){
        let technology = Technology(name: "Python", description: "Desc of Python", numberOfQuestions: 18, isStudied: true)
        sut.techManager.add(technology: technology)
        tableView.reloadData()
        
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is TechCell)
    }
    
    func test_CellForRow_DequeuescellFromTableView(){
        let mockTableView = MockTableView.mockTableView(withDataSource: sut)
        let technology = Technology(name: "Python", description: "Desc of Python", numberOfQuestions: 18, isStudied: true)
        
        sut.techManager.add(technology: technology)
        mockTableView.reloadData()
        
        _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(mockTableView.cellGotDequeued)
    }
    
    func test_CellForRow_CallsConfigureCell(){
        let mockTableView = MockTableView.mockTableView(withDataSource: sut)
        let technology1 = Technology(name: "Python", description: "Desc of Python", numberOfQuestions: 18, isStudied: true)
        
        sut.techManager.add(technology: technology1)
        mockTableView.reloadData()
        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! MockTechCell
        
        XCTAssertEqual(cell.catchedTechnology, technology1)
        
    }
    func test_GetTechnology_AddsTechnology(){
        let technology = Technology(name: "Python", description: "Desc of Python", numberOfQuestions: 18, isStudied: true)
        sut.getTechnology(technology: technology)
        let technologyCunt = sut.techManager.getCount()
        let retrievedTechnology = sut.techManager.technology(at: 0)
        
        XCTAssertEqual(technologyCunt, 1)
        XCTAssertEqual(retrievedTechnology, technology)
    }
}




extension FirstVCTests {
    class MockTableView:UITableView {
        var cellGotDequeued = false
        
        class func mockTableView(withDataSource dataSource: UITableViewDataSource) -> MockTableView {

            let mockTableView = MockTableView(frame:CGRect(x: 0, y: 0, width: 320, height: 480),  style: .plain)
            mockTableView.dataSource = dataSource
            mockTableView.register(MockTechCell.self, forCellReuseIdentifier: "TechCell")
            
            return mockTableView
        }

        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellGotDequeued = true
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    class MockTechCell: TechCell {
        var catchedTechnology:Technology?
        override func configureCell(tech: Technology) {
            catchedTechnology = tech
        }
    }
}

