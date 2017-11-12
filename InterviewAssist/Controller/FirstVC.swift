//
//  FirstVC.swift
//  InterviewAssist
//
//  Created by YC on 10/30/17.
//  Copyright © 2017 Infosys. All rights reserved.
//

import UIKit
import Foundation

class FirstVC: UIViewController, UITableViewDelegate, UITableViewDataSource, Delegate {
    
    var techManager = TechManager()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("count is \(techManager.getCount())")
        self.tableView.reloadData()
    }
    
    func getTechnology(technology: Technology) {
        techManager.add(technology: technology)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return techManager.getCount()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let technology = techManager.technology(at: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "TechCell", for: indexPath) as! TechCell
        cell.configureCell(tech: technology)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let technology = techManager.technology(at: indexPath.row)
        self.performSegue(withIdentifier: "goToDescVC", sender: technology)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? InputVC {
            destination.delegate = self
        }
        if segue.identifier == "goToDescVC" {
            if let destination = segue.destination as? DescVC {
                if let technology = sender as? Technology {
                    destination.technology = technology
                }
            }
        }
    }
}







