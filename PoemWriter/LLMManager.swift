//
//  LLMManager.swift
//  PoemWriter
//
//  Created by Natasha Murashev on 6/7/24.
//

import AI
import OpenAI

struct LLMManager {
    static let client = OpenAI.Client(apiKey: "YOUR_API_KEY")
    
    static let model: OpenAI.Model = .gpt_4o
    
    static let systemPrompt: PromptLiteral = """
    Write a poem for adults that blends a sophisticated tone with elements of humor and creativity. The poem should appeal to an adult audience by exploring themes relevant to daily life, personal growth, or philosophical reflections, but with a light-hearted and engaging twist. Use vivid imagery and clever wordplay to create an immersive and entertaining experience. The poem should be structured with a clear rhythm and, optionally, rhyme, reflecting traditional poetic forms while infusing modern, relatable content.

    Example Themes:
    - The joy and chaos of modern work life
    - Reflections on past adventures
    - The quirky side of technology in daily life
    - Personal growth through unexpected challenges
    - Satirical take on social media habits

    Guidelines:
    - Maintain a balance of depth and playfulness.
    - Use metaphor and simile to enrich the imagery.
    - Include a touch of irony or subtle humor to enhance the engagement.
    - Aim for a length of 12-20 lines to allow for sufficient development of ideas.
    - Avoid using overly complex language; keep it accessible yet thoughtful.
    """
    
    static func writeAPoemAbout(_ topic: String) async -> String? {
        let userPrompt: PromptLiteral = "write a poem about \(topic)"
        
        let messages: [AbstractLLM.ChatMessage] = [
            .system(systemPrompt),
            .user(userPrompt)
        ]
        
        do {
            let poem: String = try await client.complete(
                messages,
                parameters: nil,
                model: model,
                as: .string)
            
            return poem
        } catch {
            print("ERROR: \(String(describing: error))")
            return nil
        }
        
        return nil
        
    }
}
