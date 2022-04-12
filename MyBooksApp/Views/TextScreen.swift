//
//  TextScreen.swift
//  MyBooksApp
//
//  Created by Octav Radulian on 11.04.2022.
//

import SwiftUI

struct TextScreen: View {
    
    @EnvironmentObject var model: BookViewModel
    @State private var page = 0
    var book: Book
    
    
    var body: some View {
        TabView(selection: $page) {
            ForEach(book.content.indices) { index in
                VStack(alignment: .center) {
                    Text(book.content[index]).tag(index)
                    Spacer()
                    Text("\(page + 1)")
                }
            }.padding()
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
        .onChange(of: page, perform: { value in
            model.updatePage(forId: book.id, page: page)
        })
        .onAppear{ page = book.currentPage } 
    }
}

struct TextScreen_Previews: PreviewProvider {
    static var previews: some View {
        TextScreen(book: Book())
            .environmentObject(BookViewModel())
    }
}
