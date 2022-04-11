//
//  BookViewModel.swift
//  MyBooksApp
//
//  Created by Octav Radulian on 11.04.2022.
//

import Foundation

class BookViewModel: ObservableObject {
    
    @Published var books = [Book]()
    
    init() {
        self.books = DataService.getLocalJson()
    }
}
