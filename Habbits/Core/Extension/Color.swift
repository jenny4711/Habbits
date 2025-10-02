//
//  UIColor.swift
//  Habbits
//
//  Created by Ji y LEE on 5/13/25.
//
import SwiftUI
import UIKit

extension Color {
    /// Color → Hex String
    func toHex() -> String? {
        let uiColor = UIColor(self)
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        guard uiColor.getRed(&r, green: &g, blue: &b, alpha: &a) else { return nil }
        
        return String(format: "#%02lX%02lX%02lX",
                      lroundf(Float(r * 255)),
                      lroundf(Float(g * 255)),
                      lroundf(Float(b * 255)))
    }

    /// Hex String → Color
    init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
                           .replacingOccurrences(of: "#", with: "")
        
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)

        let r, g, b: UInt64
        switch hex.count {
        case 6: // RGB (24-bit)
            (r, g, b) = ((int >> 16) & 0xFF,
                         (int >> 8) & 0xFF,
                         int & 0xFF)
        default:
            (r, g, b) = (0, 0, 0) // invalid → black
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: 1
        )
    }
}
