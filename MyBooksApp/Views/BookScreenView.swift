//
//  BookScreenView.swift
//  MyBooksApp
//
//  Created by Octav Radulian on 11.04.2022.
//

import SwiftUI

struct BookScreenView: View {
    
    @EnvironmentObject var model: BookViewModel
    @State private var rating = 2
    var book : Book
    
    var body: some View {
        
        VStack {
            NavigationLink {
                TextScreen(book: book)
            } label: {
                VStack {
                    Text("Read now!")
                        .font(.title)
                        .accentColor(.black)
                    Image("cover\(book.id)")
                        .resizable()
                        .scaledToFit()
                }
                
            }.padding()
            Text("Mark for later!")
                .font(.headline)
            Button {
                model.updateFavourite(forId: book.id)
            } label: {
                Image(systemName: book.isFavourite ? "star.fill" : "star")
                    .resizable()
                    .frame(width: 28, height: 28)
            }.accentColor(.yellow)
            
            Text("Rate \(book.title)")
                .font(.headline)
            
            Picker("Rate this book", selection: $rating) {
                ForEach(1..<6) { index in
                    Text("\(index)").tag(index)
                            
                }
                
            }
            .pickerStyle(.segmented)
            .padding([.leading, .trailing, .bottom], 60)
            .onChange(of: rating) { newValue in
                model.updateRating(forId: book.id, rating: rating)
            }

        }
        .onAppear{ rating = book.rating }
        .navigationBarTitle("\(book.title)")

        
    }
}

struct BookScreenView_Previews: PreviewProvider {
    static var previews: some View {
        BookScreenView(book: Book())
            .environmentObject(BookViewModel())
    }
}
