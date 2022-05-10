//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Lucas Chae on 5/9/22.
//

import Foundation


extension Bundle {
    
    // input some file name and then return Astronaut array
    func decode<UnknownTypePlaceholder: Codable> (_ file: String) -> UnknownTypePlaceholder {
        
        // bundle.main.url OR extension Bundle{ self.url): using Bundle to find path to the file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        // load information of the url into an instance of data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        
        // Decoding "Date" format
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        // pass the data through JSON decoder 
        guard let loaded = try? decoder.decode(UnknownTypePlaceholder.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        
        return loaded
    }
}
