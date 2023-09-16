//
//  login.swift
//  eLibrary
//
//  Created by Sabal on 10/18/22.
//

import Foundation
import SwiftUI
import Firebase

//here just to user this isUserLoggedIn state object by all other views we made observable class
class userLogging: ObservableObject{
    
    @Published var isUserLoggedOut = false
    //see 9:40 of chat 07 if bug appear in logout
    func handleLogout(){
        isUserLoggedOut.toggle()
        try? Auth.auth().signOut()
    }
    
    
    @Published var fetchedUser = ""
    func fetchUser(){
        guard let uid = Auth.auth().currentUser?.uid else{
            print("couldnot find firestore userID")
            return
        }
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, error in
            if let error = error{
                print("Failed to fetch user :\(error)")
                return
            }
            guard let data = snapshot?.data() else {return}
            print(data)
                
        }
    }
}



//user seperate login to give prevelage
class staffLogin: ObservableObject{
    
    @Published var isStaffLoggedIn = false
}

//use environmentobject
