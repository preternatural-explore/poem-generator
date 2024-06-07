//
//  PoemDisplayView.swift
//  PoemWriter
//
//  Created by Natasha Murashev on 6/7/24.
//

import SwiftUI

struct PoemDisplayView: View {
    @State private var isSharingPoem: Bool = false
    @State private var displayedText: String = ""
    @State private var currentIndex: Int = 0
    
    let poemTopic: String
    let poemText: String
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Spacer()
                
                Text(poemTopic)
                    .font(.title)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Button(action: {
                    isSharingPoem = true
                }) {
                    Image(systemName: "square.and.arrow.up")
                        .font(.title2)
                        .foregroundColor(.blue)
                }
                .padding(.trailing)
                .sheet(isPresented: $isSharingPoem, content: {
                    ShareSheet(activityItems: [poemText])
                })
            }
            
            Text(displayedText)
                .padding()
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .onAppear(perform: startTypingEffect)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Material.ultraThin)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    private func startTypingEffect() {
        displayedText = ""
        currentIndex = 0
        let words = poemText.split(separator: " ")
        Timer.scheduledTimer(withTimeInterval: 0.4, repeats: true) { timer in
            if currentIndex < words.count {
                if displayedText.isEmpty {
                    displayedText.append(String(words[currentIndex]))
                } else {
                    displayedText.append(" " + words[currentIndex])
                }
                currentIndex += 1
            } else {
                timer.invalidate()
            }
        }
    }
}

#if os(iOS)
struct ShareSheet: UIViewControllerRepresentable {
    var activityItems: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
#elseif os(macOS)
struct ShareSheet: NSViewControllerRepresentable {
    var activityItems: [Any]

    func makeNSViewController(context: Context) -> NSViewController {
        let viewController = NSViewController()
        let picker = NSSharingServicePicker(items: activityItems)
        viewController.view = NSView(frame: .zero)
        DispatchQueue.main.async {
            picker.show(relativeTo: .zero, of: viewController.view, preferredEdge: .minY)
        }
        return viewController
    }

    func updateNSViewController(_ nsViewController: NSViewController, context: Context) {}
}
#endif


