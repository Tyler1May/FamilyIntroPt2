//
//  FamilyTableViewController.swift
//  myFamilyIntroPt2
//
//  Created by Tyler May on 10/17/23.
//

import UIKit

class FamilyTableViewController: UITableViewController {

    var members: [Member] = [
        Member(name: "Dad", image: UIImage(systemName: "person.fill")?.jpegData(compressionQuality: 0.9), description: "This is my Father Jay. He likes all kinds of sports. His favorite are football and basketball. He enjoys teaching his kids how to play any sport of their choice."),
        Member(name: "Mom", image: UIImage(systemName: "person.circle")?.jpegData(compressionQuality: 0.9), description: "This is my Mother Bethany. She likes arts and crafts and loves to sew. She also like sports and spending time with her family."),
        Member(name: "J.T.", image: UIImage(systemName: "person.circle.fill")?.jpegData(compressionQuality: 0.9), description: "This is my older brother J.T.. He likes sports aswell. His favorite sport to play basketball but also likes football aswell. He is the oldest child. He is 21 and currently working to save money for school."),
        Member(name: "Tyler", image: UIImage(systemName: "person.fill.turn.right")?.jpegData(compressionQuality: 0.9), description: "This is me, Tyler. I also love sports mostly football and followed by basketball aswell. I am the 2nd olders child. I am 19 and currently learning how to code."),
        Member(name: "Abigial", image: UIImage(systemName: "person.fill.turn.down")?.jpegData(compressionQuality: 0.9), description: "This is my younger and only sister Abigail. She loves to play volley ball and love animals. She is the 3 child. She is 17 and and a senior in Highschool"),
        Member(name: "Emmett", image: UIImage(systemName: "person.fill.turn.left")?.jpegData(compressionQuality: 0.9), description: "This is my younger brother Emmett. He loves to play football. He also loves videogames.He is the 4th child. He is currently 12 and in the 6th grade."),
        Member(name: "William", image: UIImage(systemName: "person.fill.checkmark")?.jpegData(compressionQuality: 0.9), description: "This is my younger brother William. He also loves to play football and soccer. He also likes to play videogames. He is the 5th child. He is currently 10 and in 4th grade."
),
        Member(name: "Brigham", image: UIImage(systemName: "person.fill.xmark")?.jpegData(compressionQuality: 0.9), description: "This is my youngest brother Brigham. He is a trouble maker and enjoys copying everything anyone else does. He is the 6th child. He is currently 4 and is a stay at home kid.")
    ]
    var selectedMember: Member!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return members.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedMember = members[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        if let data = members[indexPath.row].image {
            let original = UIImage(data: data)
            let renderRect = CGRect(origin: .zero, size: CGSize(width: 90, height: 90))
            let renderer = UIGraphicsImageRenderer(size: renderRect.size)
            let rounded = renderer.image { ctx in
                ctx.cgContext.addEllipse(in: renderRect)
                ctx.cgContext.clip()

                original?.draw(in: renderRect)
            }
            cell.imageView?.image = rounded
        }
        cell.textLabel?.text = members[indexPath.row].name

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? FamilyMemberViewController {
            vc.member = selectedMember
        }
    }
    
   
    


}
