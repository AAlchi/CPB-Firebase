//
//  CollegeInfo.swift
//  CPB Firebase
//
//  Created by Ali Alchikh Ibrahim on 11/14/23.
//

import Foundation
import SwiftUI

struct CollegeInfo: View {
    @AppStorage("collegeName") var collegeName = ""
    @AppStorage("collegeNumberOfStudents") var collegeNumberOfStudents = ""
    @AppStorage("collegeLocation") var collegeLocation = ""
    @AppStorage("collegeURL") var  collegeURL = ""
    
    var body: some View {
        Text("College Information")
            .bold()
        VStack(alignment: .leading) {
            VStack {
                Text("Name")
                Text("\(collegeName)")
            }
            .padding()
            .background(Color.gray.opacity(0.4))
            
            VStack {
                Text("Location")
                Text("\(collegeNumberOfStudents)")
            }
            .padding()
            .background(Color.gray.opacity(0.4))
            
            VStack {
                Text("Number of Students")
                Text("\(collegeLocation)")
            }
            .padding()
            .background(Color.gray.opacity(0.4))
            
            VStack {
                Text("Website")
                Text("\(collegeURL)")
            }
            .padding()
            .background(Color.gray.opacity(0.4))
            
        }
    }
}

