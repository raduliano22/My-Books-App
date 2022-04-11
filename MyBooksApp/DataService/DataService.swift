//
//  DataService.swift
//  MyBooksApp
//
//  Created by Octav Radulian on 11.04.2022.
//

import Foundation

class DataService {
    
    static func getLocalJson(from fileName: String = "Data", fileExtension: String = "json") -> [Book] {
        
        var books = [Book]()
        
        //get the link to data file
        let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension)
        
        guard url != nil else {
            print("Could not retrive data : \(fileName).\(fileExtension) not found.")
            return books
        }
        do {
            let data = try Data(contentsOf: url!)
            books = try JSONDecoder().decode([Book].self, from: data)
            return books
            
        } catch {
            print("Error retrieving category data: \(error)")
        }
        
        return books
    }
    
}
