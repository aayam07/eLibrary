//
//  homeViewStaff.swift
//  eLibrary
//
//  Created by Sabal on 10/20/22.
//

import SwiftUI

struct homeViewStaff: View {
    @State var selectedTab: Tab = .home    //onboardingView
    var body: some View {
        
        if selectedTab == .home{
            bookListView()
        }else if selectedTab == .scanBook{
            scanQRView()
        }else{
            bookAssignView()
        }
        
        Spacer()
        
        tabBarStaff(selectedTab: $selectedTab)
            
        
    }
}

struct homeViewStaff_Previews: PreviewProvider {
    static var previews: some View {
        homeViewStaff()
    }
}
