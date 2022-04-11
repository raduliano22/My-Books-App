//
//  BookData.swift
//  MyBooksApp
//
//  Created by Octav Radulian on 11.04.2022.
//

import Foundation

struct Book: Decodable, Identifiable {
    
    var title = "book name"
    var author = "author name"
    var isFavourite = true
    var currentPage = 0
    var rating = 0
    var id = 1
    var content = ["this is a sample content, here it will be the actual text of the book"]
    
    
}
