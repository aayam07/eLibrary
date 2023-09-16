//
//  booksDataManager.swift
//  eLibrary
//
//  Created by Sabal on 10/17/22.
//

import SwiftUI
import Firebase


class booksDataManager: ObservableObject{
    @Published var books = [Book]()
    
    
    //add function to db
    func addBooks(name: String, genere: String, author: String, numberOfBooks: String, ISBN: String){
        let db = Firestore.firestore()
        db.collection("Books").addDocument(data: ["name":name, "genere":genere, "author":author, "numberOfBooks":numberOfBooks, "ISBN": ISBN]) { error in
            if error == nil{
                //so that views get updated after data is entered
                self.fetchBooks()
            }else{
                print(error!.localizedDescription)
            }
        }
    }
    
    init(){
        fetchBooks()
    }
    
    
    //fetch/get book function
    func fetchBooks(){
        
        let db = Firestore.firestore()
        db.collection("Books").getDocuments { snapshot, error in
            if error == nil{
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.books = snapshot.documents.map{d in
                            return Book(id: d.documentID,
                                        name: d["name"] as? String ?? "",
                                        genere: d["genere"] as? String ?? "",
                                        author: d["author"] as? String ?? "",
                                        numberOfBooks: d["numberOfBooks"] as? String ?? "",
                                        ISBN: d["ISBN"] as? String ?? "")
                        }
                    }
                }
            }else{
                print(error!.localizedDescription)
            }
        }
    }
    
    func deleteBook(bookToDelete:Book){
        let db = Firestore.firestore()
        db.collection("Books").document(bookToDelete.id).delete { error in
            if error == nil{
                
                //update the UI from main thread
                DispatchQueue.main.async {
                    //remove the book that is just deleted from UI
                    self.books.removeAll { Book in
                        return Book.id == bookToDelete.id
                    }
                    
                }
            }else{
                print(error!.localizedDescription)
            }
        }
    }
    
    func updateBook(bookToUpdate: Book){
        let db = Firestore.firestore()
        //set the data to update
        db.collection("Books").document(bookToUpdate.id).setData(["name":"updated  \(bookToUpdate.name)"], merge: true){error in
            if error == nil{
                self.fetchBooks()
            }
        }
    }
    
}



