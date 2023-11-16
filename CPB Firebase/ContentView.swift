//
//  ContentView.swift
//  CPB Firebase
//
//  Created by Ali Alchikh Ibrahim on 11/6/23.
//

import SwiftUI
import FirebaseDatabase
import FirebaseDatabaseSwift

struct ContentView: View {
    
    @ObservedObject var viewModel = ViewModel()
 
          
    @State var showAlert = false
    @AppStorage("collegeName") var collegeName = ""
    @AppStorage("collegeNumberOfStudents") var collegeNumberOfStudents = ""
    @AppStorage("collegeLocation") var collegeLocation = ""
    @AppStorage("collegeURL") var  collegeURL = ""
    
    @State var colleges: [CollegeModel] = []
    
    func newCollege() {
        let newCollege  = CollegeModel(collegeName: collegeName, collegeNumberOfStudents: collegeNumberOfStudents, collegeLocation: collegeLocation, collegeURL: collegeURL)
        viewModel.AddCollege(currentCollege: newCollege)
        collegeName = ""
        collegeNumberOfStudents = ""
        collegeLocation = ""
        collegeURL = ""
    }
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    ForEach(viewModel.colleges, id: \.collegeName) { currentCollege in
                        VStack {
                            Text("Name: \(currentCollege.collegeName)")
                            Text("Location: \(currentCollege.collegeLocation)")
                            Text("# of Students: \(currentCollege.collegeNumberOfStudents)")
                            Text("URL: \(currentCollege.collegeURL)")
                        }
                    }
                    Button(action: {
                        showAlert = true
                    }, label: {
                        Text("Add College")
                    })
                    .alert("Add a College", isPresented: $showAlert) {
                        VStack {
                            TextField("College Name", text: $collegeName)
                            TextField("Number of Students", text: $collegeNumberOfStudents)
                            TextField("College Location", text: $collegeLocation)
                            TextField("College URL", text: $collegeURL)
                        }
                        
                        Button("OK", role: .cancel) {
                            newCollege()
                            
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
