> [!IMPORTANT]
> Created by [Preternatural AI](https://preternatural.ai/), an exhaustive client-side AI infrastructure for Swift.<br/>
> This project and the frameworks used are presently in alpha stage of development.

# Poem Generator: Personalized poetry, anytime, any topic!

PoemGenerator is a simple demonstration of the LLM completions API. The user enters a poem topic and the LLM generates a full poem about the topic. 
<br/><br/>
[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://github.com/PreternaturalAI/AI/blob/main/LICENSE)

## Table of Contents
- [Usage](#usage)
- [Key Concepts](#key-concepts)
- [Preternatural Frameworks](#preternatural-frameworks)
- [Technical Specifications](#technical-specifications)
- [License](#license)

## Usage
#### Supported Platforms
<!-- macOS-->
<p align="left">
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/PreternaturalAI/AI/main/Images/macos.svg">
  <source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/PreternaturalAI/AI/main/Images/macos-active.svg">
  <img alt="macos" src="https://raw.githubusercontent.com/PreternaturalAI/AI/main/Images/macos-active.svg" height="24">
</picture>&nbsp;

<!--iPhone-->
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/PreternaturalAI/AI/main/Images/ios.svg">
  <source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/PreternaturalAI/AI/main/Images/ios-active.svg">
  <img alt="ios" src="https://raw.githubusercontent.com/PreternaturalAI/AI/main/Images/ios-active.svg" height="24">
</picture>&nbsp;

<!-- iPad-->
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/PreternaturalAI/AI/main/Images/ipados.svg">
  <source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/PreternaturalAI/AI/main/Images/ipados-active.svg">
  <img alt="ipados" src="https://raw.githubusercontent.com/PreternaturalAI/AI/main/Images/ipados-active.svg" height="24">
</picture>&nbsp;
</p>
To install and run PoemGenerator:
1. Download and open the project
2. Add your OpenAI API Key in the `LLMManager` file:

```swift
// LLMManager
static let client = OpenAI.Client(apiKey: "YOUR_API_KEY")
```
*You can get the OpenAI API key on the [OpenAI developer website](https://platform.openai.com/). Note that you have to set up billing and add a small amount of money for the API calls to work (this will cost you less than 1 dollar).* 

3. Run the project on the Mac, iPad, or iPhone
4. Type in the poem topic you'd like generated. Here is the generated poem for "WWDC":

<img width="688" alt="poemwriterscreenshot" src="https://github.com/preternatural-explore/PoemWriter/assets/1157147/9e7f96ab-33f1-43bd-8903-94f55adacf31">

## Key Concepts
This app is an introduction to working with LLM completions API. 

## Preternatural Frameworks
The following Preternatural Frameworks were used in this project: 
- [AI](https://github.com/PreternaturalAI/AI): The definitive, open-source Swift framework for interfacing with generative AI.
- [SwiftUIZ](https://github.com/SwiftUIX/SwiftUIZ): A framework to support ambitious expansions to SwiftUI.

## Technical Specifications
Before Large Language Models (LLMs) became so widely used in the outbreak ChatGPT product, they were actually tested as super powerful completion machines. Based on just a simple prompt such as “And the cow jumped over the moon” for example, the LLM could complete it into a full original poem following in the pattern of the famous "Hey, diddle, diddle," nursery rhyme by Mother Goose. It achieves this by generating the next most likely word (or "token" to be more precise) based on all the training data it has processed, which can be as vast as the entire internet.

However, the LLM’s standalone completion functionality by itself was not found as usable in that state. Instead, OpenAI trained a new model (a brilliant move, in retrospect) with the help of thousands of overseas human workers to apply the completion functionality of the LLM in a User-Assistant conversation format. This chat interface became the breakout product of LLMs.

Knowing this is important for us, as developers. Because while on the surface most of consumers think of LLMs as “Chat”, they are still completion machines under the hood. They are simply completing the input they receive based on probabilities. The PoemGenerator is a demonstration of this concept. In the PoemGenerator, the user never directly "chats" with OpenAI's GPT model. They simple put in a poem title, and the LLM model completes the poem. 

### Technical Implementation
To make a completion request to OpenAI's LLM model, we need to "complete" a few steps using [Preternatural's AI framework](https://github.com/PreternaturalAI/AI): 

1. Import the AI Framework along with the LLM Client you plan to use:
```swift
import AI
import OpenAI

// Other Client Options
//import Anthropic
//import Mistral
//import Groq

```
2. Specify the LLM client (in our case, OpenAI, but you can replace this for Anthropic / Mistral / Groq / etc):
```swift
static let client = OpenAI.Client(apiKey: "YOUR_API_KEY")

// other clients can easily be used
//    static let client = Anthropic.Client(apiKey: "YOUR_API_KEY")
//    static let client = Mistral.Client(apiKey: "YOUR_API_KEY")
//    static let client = Groq.Client(apiKey: "YOUR_API_KEY")
```
3. Specify the LLM Model
```swift
static let model: OpenAI.Model = .gpt_4o // .gpt_4, .gpt_3_5

// multiple model options for other clients available
//    static let model: Anthropic.Model = .haiku
//    static let model: Mistral.Model = .mistral_medium
//    static let model: Groq.Model = .llama3_70b
```
4. Specify the System Prompt to give the LLM model general instructions.
```swift
    static let systemPrompt: PromptLiteral = """
    Write a poem for adults that blends a sophisticated tone with elements of humor and creativity.
    The poem should appeal to an adult audience by exploring themes relevant to daily life, personal growth, or philosophical reflections,
    but with a light-hearted and engaging twist. Use vivid imagery and clever wordplay to create an immersive and entertaining experience.
    The poem should be structured with a clear rhythm and, optionally, rhyme, reflecting traditional poetic forms while infusing modern, relatable content.

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
```

5. Write a function that takes in the user's poem topic and makes the completion request:
```swift
static func writeAPoemAbout(_ topic: String) async -> String? {
    // the user prompt simply integrates the user's poem topic
    let userPrompt: PromptLiteral = "write a poem about \(topic)"

    // give the system and user promts to the LLM in the form of chat messages
    let messages: [AbstractLLM.ChatMessage] = [
        .system(systemPrompt),
        .user(userPrompt)
    ]
    
    do {
        // run the completion request and get back the poem text
        let poem: String = try await client.complete(
            messages,
            parameters: nil,
            model: model,
            as: .string)
        
        return poem
    } catch {
        print(error)
    }
    
    return nil
    
}
```

You can view the full implementation of the completion request in the `LLMManager` file. 

### Conclusion
Understanding the underlying mechanics of Large Language Models (LLMs) as powerful completion machines provides valuable insight into how they can be leveraged for various applications beyond simple chat interfaces. The PoemGenerator example demonstrates this by utilizing the completion capabilities of OpenAI's GPT model to generate poems based on user-specified topics. This approach can be adapted for a wide range of applications, from creative writing to more complex problem-solving tasks, showcasing the versatility and power of LLMs in enhancing user experiences through natural language processing.

## License

This package is licensed under the [MIT License](https://github.com/PreternaturalAI/AI/blob/main/LICENSE).




