//
//  tabBar.swift
//  eLibrary
//
//  Created by Sabal on 10/18/22.
//

import SwiftUI

enum Tabs: Int{
    case home = 0
    case profile = 1
}

struct tabBar: View {
    @Binding var selectedTab:Tabs
    
    var body: some View {
        HStack(alignment: .center){
            Button {
                //list of books
                selectedTab = .home
                
                
            } label: {
                tabBarButton(buttonImage: "house",
                             buttonName: "Home",
                             isActive: selectedTab == .home)
            }
            .tint(Color(.brown))
            
            
            //this button should appear for staff only
            Button {
                //add books
                
        
                
            } label: {
                VStack(alignment: .center, spacing: 4){
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 42, height: 42)
                    Text("Add Books")
                }
            }
            
            
            Button {
                //Profile
                selectedTab = .profile
            } label: {
                tabBarButton(buttonImage: "person", buttonName: "Profile", isActive: selectedTab == .profile)
//                GeometryReader{ geo in
//                    if selectedTab == .profile{
//                        Rectangle()
//                            .foregroundColor(.blue)
//                            .frame(width: geo.size.width/2, height: 5)
//                            .padding(.leading, geo.size.width/4)
//                    }
//                    VStack(alignment: .center, spacing: 4){
//                        Image(systemName: "person")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 30, height: 30)
//                        Text("Profile")
//                    }
//                    .frame(width: geo.size.width, height: geo.size.height)
//                }
            }
            .tint(Color(.brown))
            
        }
        .frame(height: 82)
    }
}

struct tabBar_Previews: PreviewProvider {
    static var previews: some View {
        tabBar(selectedTab: .constant(.home))
    }
}
