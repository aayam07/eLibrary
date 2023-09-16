//
//  eLibraryApp.swift
//  eLibrary
//
//  Created by Sabal on 9/11/22.
//

import SwiftUI
import Firebase

@main
struct eLibraryApp: App {
//    @StateObject var BooksDataManager = booksDataManager()
    
    init(){
        FirebaseApp.configure()
    }
    
    
    
    var body: some Scene {
        WindowGroup {
            splashScreenView()
                .environmentObject(booksDataManager())
                .environmentObject(userLogging())
            
            ///below code is for ContentView
                //.environmentObject(userLogin())  //also staffLogin()
        }
    }
}
