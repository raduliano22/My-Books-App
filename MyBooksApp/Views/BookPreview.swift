//
//  BookPreview.swift
//  MyBooksApp
//
//  Created by Octav Radulian on 11.04.2022.
//

import SwiftUI

struct BookPreview: View {
    
    var book: Book
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(color: .gray, radius: 5, x: -5, y: 5)
            VStack {
                HStack {
                    Text(book.title)
                        .font(.title)
                    .bold()
                    
                    Spacer()
                    
                    if book.isFavourite {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 28, height: 28)
                            .foregroundColor(.yellow)
                    }
                }
                
                Text(book.author)
                    .italic()
                
                Image("cover\(book.id)")
                    .resizable()
                    .scaledToFit()
                
            }
            .padding()
        }
        .accentColor(.black)
        
    }
}

struct BookPreview_Previews: PreviewProvider {
    static var previews: some View {
        BookPreview(book: Book())
    }
}
