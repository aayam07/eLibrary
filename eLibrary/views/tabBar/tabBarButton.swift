//
//  tabBarButton.swift
//  eLibrary
//
//  Created by Sabal on 10/18/22.
//

import SwiftUI

struct tabBarButton: View {
    var buttonImage:String
    var buttonName: String
    var isActive: Bool
    var body: some View {
        
        GeometryReader{ geo in
            if isActive{
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: geo.size.width/2, height: 5)
                    .padding(.leading, geo.size.width/4)
            }
            
            VStack(alignment: .center, spacing: 4){
                Image(systemName: buttonImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                Text(buttonName)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct tabBarButton_Previews: PreviewProvider {
    static var previews: some View {
        tabBarButton(buttonImage: "house", buttonName: "Home", isActive: true)
    }
}
