//
//  ContentView.swift
//  MyBooksApp
//
//  Created by Octav Radulian on 11.04.2022.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var model: BookViewModel
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVStack(alignment:.leading, spacing: 30) {
                    ForEach(model.books) { book in
                        NavigationLink {
                            BookScreenView(book: book)
                        } label: {
                            BookPreview(book: book)
                                .padding([.leading,.trailing], 20)
                        }

                    }
                }.padding(.top)
            }.navigationTitle("My Library")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(BookViewModel())
    }
}
