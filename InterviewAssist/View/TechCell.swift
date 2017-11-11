//
//  TechCell.swift
//  InterviewAssist
//
//  Created by YC on 10/30/17.
//  Copyright © 2017 Infosys. All rights reserved.
//

import UIKit

class TechCell: UITableViewCell {
    
    @IBOutlet weak var techName: UILabel!
    @IBOutlet weak var numberOfQuestions: UILabel!
    @IBOutlet weak var studiedImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCell(tech: Technology){
        self.techName.text = tech.name
        self.numberOfQuestions.text = "\(tech.numberOfQuestions)"
        if tech.isStudied {
            self.studiedImage.image = UIImage(named: "icon_green")
        } else {
            self.studiedImage.image = UIImage(named: "icon_red")
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
