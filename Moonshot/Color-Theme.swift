//
//  Color-Theme.swift
//  Moonshot
//
//  Created by Lucas Chae on 5/9/22.
//

import Foundation
import SwiftUI


// Place those inside a very specific extension that allows to use these color anywhere where ShapeStyle is given.
// As Paul woudl say, "This ShapeStyle protocol is what the background() modifier uses, so what we really want to do is extend Color but do so in a way that all the SwiftUI modifiers using ShapeStyle work too. This can be done with a very precise extension that literally says “we want to add functionality to ShapeStyle, but only for times when it’s being used as a color.”" 
extension ShapeStyle where Self == Color {
    static var darkBackground: Color {
        Color(red: 0.1, green: 0.1, blue: 0.2)
    }
    static var lightBackground: Color {
        Color(red: 0.2, green: 0.2, blue: 0.3)
    }
}
