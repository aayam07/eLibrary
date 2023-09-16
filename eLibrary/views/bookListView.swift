//
//  bookListView.swift
//  eLibrary
//
//  Created by Sabal on 10/18/22.
//

import SwiftUI

struct bookListView: View {
    @EnvironmentObject var dataManager:booksDataManager
    
    
    @State private var showPopup = false
    @State private var searchText = ""
    
    var body: some View {
        
        NavigationView {
            VStack {
                //searchBarView()
                
                //search by name and author
                List(dataManager.books.filter{(self.searchText.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(self.searchText) || $0.author.localizedCaseInsensitiveContains(self .searchText))}, id: \.id){ item in
                    
                    NavigationLink(destination: bookDetailView(data: item)){
                        HStack {
                            VStack(alignment: .leading){
                                Text(item.name)
                                    .font(.headline)
                                Text(item.author)
                                    .font(.subheadline)
                                
                            }
                            Spacer()
                            //update book can only be done by staff
                            Button {
                                dataManager.updateBook(bookToUpdate: item)
                            } label: {
                                Image(systemName: "pencil")
                            }
                            .buttonStyle(BorderlessButtonStyle())
                            
                            //***deleting can only be donw by staff
                            Button {
                                dataManager.deleteBook(bookToDelete: item)
                            } label: {
                                Image(systemName: "minus.circle")
                            }
                            .buttonStyle(BorderlessButtonStyle())
                            
                        }
                    }
                    
                    
                }
                .navigationTitle("Books")
                .searchable(text: $searchText)
                .navigationBarItems(trailing: Button(action: {
                    //add
                    showPopup.toggle()
                }, label: {
                    Image(systemName: "plus")
                        .frame(width: 60 , height: 60)
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
                }) )
                .sheet(isPresented: $showPopup){
                    addBookView()
                }
                
            }
            
        }
        
        
    }
    //    init(){
    //        dataManager.fetchBooks()
    //    }
}



struct bookListView_Previews: PreviewProvider {
    static var previews: some View {
        bookListView()
    }
}
