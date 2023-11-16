//
//  ViewModel.swift
//  CPB Firebase
//
//  Created by Ali Alchikh Ibrahim on 11/14/23.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

class ViewModel: ObservableObject {
    @Published var colleges: [CollegeModel] = []
    init() {
        PullFromFirebase()
    }
    
    func AddCollege(currentCollege: CollegeModel) {
        colleges.append(currentCollege)
        AddToFirebase(college: currentCollege)
    }
    
    func AddToFirebase(college: CollegeModel) {
        let database = Database.database().reference()
        let collegeDictionary = ["location": "", "numberOfStudents": "", "url": ""]
        database.child("Colleges").child("\(college.collegeName)").setValue(collegeDictionary)
    }
    
    func PullFromFirebase() {
        let databaseRef = Database.database().reference().child("Colleges")
        databaseRef.getData { myError, myDataSnapshot in
            var newCollege: [CollegeModel] = []
            for college in myDataSnapshot?.children.allObjects as! [DataSnapshot] {
                let nameCollege = college.key
                let dictionary = college.value as! [String: String]
                guard let studentsCollege = dictionary["numberOfStudents"] else { return }
                guard let locationCollege = dictionary["location"] else { return }
                guard let urlCollege = dictionary["url"] else { return }
                
                let currentCollege = CollegeModel(collegeName: nameCollege, collegeNumberOfStudents: studentsCollege, collegeLocation: locationCollege, collegeURL: urlCollege)
                newCollege.append(currentCollege)
                
            }
            self.colleges = newCollege
        }
    }
}
