//
//  bookDetailView.swift
//  eLibrary
//
//  Created by Sabal on 10/22/22.
//

import SwiftUI

struct bookDetailView: View {
    let data: Book
    var body: some View {
        VStack(spacing: 5){
            Text("Book Name: \(data.name)")
            Text("Author: \(data.author)")
            Text("Genere: \(data.genere)")
            Text("ISBN: \(data.ISBN)")
            Text("Number of available Books: \(data.numberOfBooks)")
        }
        .font(.headline)
        .frame(width: 400 , height: 200)
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

struct bookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        bookDetailView(data: Book(id:"0", name: "book name", genere: "book genere", author: "book author", numberOfBooks: "number", ISBN: "isbn number"))
    }
}


