//
//  FamilyMemberViewController.swift
//  myFamilyIntroPt2
//
//  Created by Tyler May on 10/17/23.
//

import UIKit

class FamilyMemberViewController: UIViewController {
        
    @IBOutlet var familyMemberLabel: UILabel!
    @IBOutlet var familyMemberImage: UIImageView!
    @IBOutlet var DescriptionLabel: UILabel!
    
    var member: Member?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let member = member {
            familyMemberLabel.text = member.name
            if let imageData = member.image {
                familyMemberImage.image = UIImage(data: imageData)
                DescriptionLabel.text = member.description
            }
        }
    }
    
    
}
