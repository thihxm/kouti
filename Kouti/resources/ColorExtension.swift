//
//  ColorExtension.swift
//  Kouti
//
//  Created by Marco Zulian on 27/06/21.
//

import Foundation
import SwiftUI

extension Color: Codable {
    enum CodingKeys: String, CodingKey {
       case r
       case g
       case b
       case a
    }

    
    public func encode(to encoder: Encoder) throws {
        let uiColor = UIColor(self)
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        print("Storing: r:\(red), g:\(green), b:\(blue), a:\(alpha)")
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(red, forKey: .r)
        try container.encode(green, forKey: .g)
        try container.encode(blue, forKey: .b)
        try container.encode(alpha, forKey: .a)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let r = try container.decode(CGFloat.self, forKey: .r)
        let g = try container.decode(CGFloat.self, forKey: .g)
        let b = try container.decode(CGFloat.self, forKey: .b)
        let a = try container.decode(CGFloat.self, forKey: .a)
        print("Decoded: r:\(r), g:\(g), b:\(b), a:\(a)")
        let uiColor = UIColor(red: r, green: g, blue: b, alpha: a)
        self.init(uiColor)
    }
}
