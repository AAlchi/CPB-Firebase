//
//  CPB_FirebaseApp.swift
//  CPB Firebase
//
//  Created by Ali Alchikh Ibrahim on 11/6/23.
//


//git: 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

import SwiftUI
import FirebaseCore

@main
struct CPB_FirebaseApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
