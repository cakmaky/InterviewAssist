//
//  TechManager.swift
//  InterviewAssist
//
//  Created by YC on 11/5/17.
//  Copyright © 2017 Infosys. All rights reserved.
//

import Foundation

class TechManager {
    
    private var technologies = [Technology]()
    func add(technology: Technology){
        if !technologies.contains(technology){
            self.technologies.append(technology)
        }
    }
    
    func remove(technology: Technology){
        if technologies.contains(technology){
            for (index, value) in technologies.enumerated() {
                if value == technology {
                    technologies.remove(at: index)
                }
            }
        }
    }
    
    func technology(at index: Int) -> Technology {
        return technologies[index]
    }
    
    func getCount() -> Int {
        return technologies.count
    }
    
    func removeAll() {
        technologies.removeAll()
    }
}
