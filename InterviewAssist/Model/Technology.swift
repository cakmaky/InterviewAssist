//
//  Technology.swift
//  InterviewAssist
//
//  Created by YC on 10/31/17.
//  Copyright © 2017 Infosys. All rights reserved.
//

import Foundation

class Technology: Equatable {
    private var _name:String!
    private var _description:String!
    private var _numberOfQuestions:Int!
    private var _isStudied:Bool!
    
    var name:String {
        get {
            return _name
        }
        set {
            self._name = newValue
        }
    }
    var description:String {
        get {
            return _description
        }
        set {
            self._description = newValue
        }
    }
    var numberOfQuestions:Int {
        get {
            return _numberOfQuestions
        }
        set {
            self._numberOfQuestions = newValue
        }
    }
    var isStudied:Bool {
        get {
            return _isStudied
        }
        set {
            self._isStudied = newValue
        }
    }
    
    init(name:String, description:String, numberOfQuestions:Int, isStudied:Bool){
        self._name = name
        self._description = description
        self._numberOfQuestions = numberOfQuestions
        self._isStudied = isStudied
    }
    
    static func ==(lhs: Technology, rhs: Technology) -> Bool {
        if lhs.name != rhs.name {
            return false
        }
        if lhs.description != rhs.description {
            return false
        }
        if lhs.numberOfQuestions != rhs.numberOfQuestions {
            return false
        }
        if lhs.isStudied != rhs.isStudied {
            return false
        }
        return true
    }
}

















