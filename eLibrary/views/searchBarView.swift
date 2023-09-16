//
//  searchBarView.swift
//  eLibrary
//
//  Created by Sabal on 10/19/22.
//

/// this view is currently not used its alternative .searchable() is used in bookListView
import SwiftUI

struct searchBarView: View {
    
    @State var searchText:String = ""
    
    var body: some View {
        
        HStack{
            Image(systemName: "magnifyingglass")
            
                .foregroundColor(searchText.isEmpty ? Color.theme.secondaryText : Color.theme.accent)
            
            TextField("Search by Book name", text: $searchText)
                .foregroundColor(Color.theme.accent)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundColor(Color.theme.accent)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            searchText = ""
                        }
                    , alignment: .trailing
                )
                
        }
        .font(.headline)
        .padding()
        .background{
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.theme.background)
                .shadow(color: Color.theme.accent.opacity(0.15),radius: 10, x: 0, y: 0)
                
        }
        .padding()
        
    }
}

struct searchBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            searchBarView()
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
            
            searchBarView()
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
        
        
            
    }
}
