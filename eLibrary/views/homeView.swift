//
//  homeView.swift
//  eLibrary
//
//  Created by Sabal on 10/17/22.
//

import SwiftUI

struct homeView: View {
    @State var selectedTab: Tabs = .home    //onboardingView
    var body: some View {
        
        if selectedTab == .home{
            bookListView()
        }else {
            profileView()
        }
        
        
        Spacer()
        
        tabBar(selectedTab: $selectedTab)
        
    }
    
}





struct homeView_Previews: PreviewProvider {
    static var previews: some View {
        homeView()
    }
}
