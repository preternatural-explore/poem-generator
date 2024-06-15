//
//  SymbolsBackground.swift
//  PoemWriter
//
//  Created by Natasha Murashev on 6/7/24.
//

import SwiftUI

struct SymbolsBackground: View {
    private let symbolNames = [
        "pencil", "highlighter", "book", "book.closed", "note.text",
        "text.book.closed", "character.book.closed.fill", "signature",
        "scribble", "quote.bubble", "paintpalette"
    ]
    private let colors: [Color] = [.pink, .purple, .green, .orange, .blue]
    
    #if os(iOS)
    private let screenBounds = UIScreen.main.bounds  // Using screen bounds for positioning
    #elseif os(macOS)
    // Retrieve the main screen's bounds for macOS
    private var screenBounds: CGRect {
        NSScreen.main?.frame ?? CGRect.zero
    }
    #endif

    var body: some View {
        let rows = 20  // Increased number of rows for more vertical coverage
        let columns = 20  // Increased number of columns for more horizontal coverage
        let symbolSize: CGFloat = 30
        let spacing: CGFloat = 40  // Adjusted spacing to ensure coverage over the entire screen

        // Calculate total grid width and height
        let totalWidth = CGFloat(columns) * (symbolSize + spacing)
        let xOffset = (screenBounds.width - totalWidth) / 2
        let totalHeight = CGFloat(rows) * (symbolSize + spacing)
        let yOffset = (screenBounds.height - totalHeight) / 2

        return ZStack {
            ForEach(0..<rows * columns, id: \.self) { index in
                let row = index / columns
                let column = index % columns
                symbolView(index: index, symbolSize: symbolSize)
                    .position(x: xOffset + CGFloat(column) * (symbolSize + spacing),
                              y: yOffset + CGFloat(row) * (symbolSize + spacing))
            }
        }
    }

    // Function to create each symbol view
    private func symbolView(index: Int, symbolSize: CGFloat) -> some View {
        Image(systemName: symbolNames[index % symbolNames.count])
            .resizable()
            .scaledToFit()
            .frame(width: symbolSize, height: symbolSize)
            .foregroundColor(colors[index % colors.count].opacity(0.5))
            .rotationEffect(.degrees(Double.random(in: 0...360)))
    }
}
