//
//  TechCellTests.swift
//  InterviewAssistTests
//
//  Created by YC on 11/9/17.
//  Copyright © 2017 Infosys. All rights reserved.
//

import XCTest

@testable import InterviewAssist

class TechCellTests: XCTestCase {
    
    var tableView: UITableView!
    let dataSource = FakeDataSource()
    var cell: TechCell!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController( withIdentifier: "FirstVC")as! FirstVC
        
        _ = controller.view
        
        tableView = controller.tableView
        tableView?.dataSource = dataSource
        
        cell = tableView?.dequeueReusableCell(withIdentifier: "TechCell", for: IndexPath(row: 0, section: 0)) as! TechCell
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_HasTechNameLabel(){
        
        XCTAssertNotNil(cell.techName)
    }
    
    func test_HasNumberOfQuestionsLabel(){
        
        XCTAssertNotNil(cell.numberOfQuestions)
    }
    
    func test_HasStudiedImageView(){
        
        XCTAssertNotNil(cell.studiedImage)
    }
    
    func test_ConfigureCell_SetsValues(){
        let technology = Technology(name: "Python", description: "Desc of Python", numberOfQuestions: 18, isStudied: true)
        
        cell.configureCell(tech: technology)
        
        XCTAssertEqual(cell.techName.text, "Python")
        XCTAssertEqual(cell.numberOfQuestions.text, "18")
        XCTAssertEqual(cell.studiedImage.image, UIImage(named:"icon_green"))
    }
}

extension TechCellTests {
    class FakeDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}
