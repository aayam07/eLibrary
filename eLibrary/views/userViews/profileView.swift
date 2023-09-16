//
//  profileView.swift
//  eLibrary
//
//  Created by Sabal on 10/18/22.
//

import SwiftUI
import Firebase

struct profileView: View {
    @State private var shouldShowLogoutOption = false
    
    @EnvironmentObject var logout:userLogging
    var body: some View {
        VStack {
            
            HStack {
                Text("Profile view ")
                Spacer()
                Button {
                    shouldShowLogoutOption.toggle()
                } label: {
                    Image(systemName: "gear")
                }

            }
            .padding()
            .actionSheet(isPresented: $shouldShowLogoutOption){
                .init(title: Text("Setting"), message: Text("What do you want to do"), buttons: [
                    .destructive(Text("LogOut"), action: {
                        logout.handleLogout()
                        print("do logout")
                    }),
                    .cancel()
                ])
            }
            .fullScreenCover(isPresented: $logout.isUserLoggedOut, onDismiss: nil) {
//                loginView(didCompleteLoginProcess: {
//                    self.logout.isUserLoggedOut = false
//                })
                loginView()
            }
            
        }
    }
}

struct profileView_Previews: PreviewProvider {
    static var previews: some View {
        profileView()
            .preferredColorScheme(.dark)
    }
}
