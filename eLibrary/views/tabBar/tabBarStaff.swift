//
//  tabBarStaff.swift
//  eLibrary
//
//  Created by Sabal on 10/20/22.
//

import SwiftUI


//Tab is for Staff and Tabs is for User view that enum is in tabBar view
//but selectedTab is common name of User and Staff but they work seperately
enum Tab: Int{
    case home = 0
    case scanBook = 1
    case scanUser = 2
}

struct tabBarStaff: View {
    @Binding var selectedTab :Tab
    
    var body: some View {
        //make tab bar with home, scanUser, scanBook and pass to tabBarButton View
        
        HStack {
            Button {
                //list of books
                selectedTab = .home
                
                
            } label: {
                tabBarButton(buttonImage: "house",
                             buttonName: "Home",
                             isActive: selectedTab == .home)
            }
            .tint(Color(.brown))
            
            Button {
                //Book is scanned
            selectedTab = .scanBook
                
            } label: {
                tabBarButton(buttonImage: "qrcode.viewfinder",
                             buttonName: "Scan Book",
                             isActive: selectedTab == .scanBook)
            }
            .tint(Color(.brown))
            
            Button {
                //Scan The User
                selectedTab = .scanUser
                
                
            } label: {
                tabBarButton(buttonImage: "qrcode.viewfinder",
                             buttonName: "Scan User",
                             isActive: selectedTab == .scanUser)
            }
            .tint(Color(.brown))
        }
        .frame(height: 82)
        
    }
    
}

struct tabBarStaff_Previews: PreviewProvider {
    static var previews: some View {
        tabBarStaff(selectedTab: .constant(.home))
    }
}
