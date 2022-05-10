//
//  Astronaut.swift
//  Moonshot
//
//  Created by Lucas Chae on 5/9/22.
//

import Foundation


// Codable: You can make instances of this thing straight from JSON

struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String    
}
