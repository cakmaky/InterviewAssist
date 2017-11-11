//
//  DescVC.swift
//  InterviewAssist
//
//  Created by YC on 10/31/17.
//  Copyright © 2017 Infosys. All rights reserved.
//

import UIKit

class DescVC: UIViewController {

    var technology:Technology!
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textView.text = technology.description
    }
}
