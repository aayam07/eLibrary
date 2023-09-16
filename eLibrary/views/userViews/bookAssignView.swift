//
//  bookAssignView.swift
//  eLibrary
//
//  Created by Sabal on 10/20/22.
//



//this view will have scan button and after user is scanned it will open detail of user that is fetchdata from "User" and perform add data to book
import SwiftUI
import AuthenticationServices

struct bookAssignView: View {
    @State private var isActive = false
    var body: some View {
        //        VStack{
        //            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        //
        //            Spacer()
        //
        //            Button {
        //                //scan garne ho
        //            } label: {
        //                Image(systemName: "qrcode.viewfinder")
        //            }
        //
        //        }
        
        
        
        
        // neumorphic button
        //        VStack {
        //            Image(systemName: "house")
        //                .frame(width: 130 , height: 70)
        //                .background(
        //                    ZStack {
        //                        Color.theme.dropShadow
        //                        RoundedRectangle(cornerRadius: 50, style: .continuous)
        //                            .foregroundColor(.white)
        //                            .blur(radius: 4)
        //                            .offset(x: -8, y: -8)
        //
        //                        RoundedRectangle(cornerRadius: 50, style: .continuous)
        //                            .fill(
        //                                LinearGradient(colors: [Color.theme.dropShadow, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
        //                            )
        //                            .padding(2)
        //                            .blur(radius: 2)
        //                    }
        //                )
        //                .clipShape(RoundedRectangle(cornerRadius: 50, style: .continuous))
        //                .shadow(color: Color.theme.dropShadow, radius: 20, x: 20, y: 20)
        //                .shadow(color: .white, radius: 20, x: -20, y: -20)
        //        }
        //        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //        .background(Color.theme.backColor)
        //        .ignoresSafeArea(.all)
        //
        
        
        
        NavigationView {
            NavigationLink(destination: scanQRView(), isActive: self.$isActive) {
                VStack {
                    Image(systemName: "qrcode.viewfinder")
                        .frame(width: 130 , height: 70)
                        .background(
                            ZStack {
                                Color.theme.dropShadow
                                RoundedRectangle(cornerRadius: 50, style: .continuous)
                                    .foregroundColor(.white)
                                    .blur(radius: 4)
                                    .offset(x: -8, y: -8)
                                
                                RoundedRectangle(cornerRadius: 50, style: .continuous)
                                    .fill(
                                        LinearGradient(colors: [Color.theme.dropShadow, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                                    )
                                    .padding(2)
                                    .blur(radius: 2)
                            }
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 50, style: .continuous))
                        .shadow(color: Color.theme.dropShadow, radius: 20, x: 20, y: 20)
                        .shadow(color: .white, radius: 20, x: -20, y: -20)
                }
            }
            .buttonStyle(PlainButtonStyle())
            
            
            
        }
    }
}

struct bookAssignView_Previews: PreviewProvider {
    static var previews: some View {
        bookAssignView()
    }
}
