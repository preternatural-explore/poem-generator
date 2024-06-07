//
//  ContentView.swift
//  PoemWriter
//
//  Created by Natasha Murashev on 6/7/24.
//

import SwiftUI
import SwiftUIX
import SwiftUIZ

struct ContentView: View {
    
    @State private var userInput: String = ""
    @FocusState private var isInputFocused: Bool
    
    @State private var poemTopic: String? = nil
    @State private var poemText: String? = nil
    @State private var isWritingPoem: Bool = false
    
    
    // Custom font and color definitions
    let customFont = Font.custom("Georgia-Italic", size: 24).bold()
    let textColor = Color.indigo
    let borderColor = Color.gray.opacity(0.5)
    let inputFont = Font.system(size: 24)
    
    var body: some View {
        
        ZStack {
            // Subtle background gradient
            LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.1), Color.blue.opacity(0.2)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            // Scatter SF Symbols as background elements
            SymbolsBackground()
            
            ScrollView {
                VStack {
                    poemInputView
                    writeButton
                    poemDisplayView
                }
                .padding()
                .cornerRadius(20)
                .padding(.horizontal, 20)
                .animation(.easeInOut, value: userInput)
            }
        }
    }
    
    @ViewBuilder
    private var poemInputView: some View {
        Text("I want a poem about...")
            .font(customFont)
            .italic()
            .foregroundColor(textColor)
            .padding(.vertical, 10)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 2)
        
        TextView(text: $userInput)
            .focused($isInputFocused)
            .frame(minHeight: 100, alignment: .top)
            .padding(.small)
            .font(inputFont)
            .border(borderColor, width: 2, cornerRadius: 8)
            ._focusActivatingBackground {
                Color.almostClear
            }
            .shadow(radius: 3)
    }
    
    @ViewBuilder
    private var writeButton: some View {
        ZStack {
            Button("WRITE") {
                poemText = nil
                isInputFocused = false
                isWritingPoem = true
                Task {
                    if !userInput.isEmpty {
                        self.poemText = await LLMManager.writeAPoemAbout(userInput)
                        self.poemTopic = userInput
                        self.userInput = ""
                        self.isWritingPoem = false
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
            .font(Font.title2.weight(.semibold))
            .disabled(userInput.isEmpty || isWritingPoem)
            
            if isWritingPoem {
                ProgressView()
            }
        }
    }
    
    @ViewBuilder
    private var poemDisplayView: some View {
        // Display the generated poem
        if let poemTopic = poemTopic, let poemText = poemText {
            PoemDisplayView(poemTopic: poemTopic, poemText: poemText)
        }
    }
}

