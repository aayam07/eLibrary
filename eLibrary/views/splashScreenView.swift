//
//  splashScreenView.swift
//  eLibrary
//
//  Created by Sabal on 10/22/22.
//

import SwiftUI

struct splashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var body: some View {
        if isActive{
            //view after splash screen
            loginView()
//            ContentView()
//                .environmentObject(booksDataManager())
           
        }else{
            VStack{
                VStack{
                    //replace image with logo of elibrary
                    Image(systemName: "hare.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.red)
                    Text("E-Library")
                        .font(Font.custom("Baskerville-Bold", size: 26))
                        .foregroundColor(.red.opacity(0.8))
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size = 1.0
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    self.isActive = true
                }
            }
        }
        
    }
}

struct splashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        splashScreenView()
    }
}
