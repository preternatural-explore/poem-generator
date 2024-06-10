# Poem Generator: Personalized poetry, anytime, any topic!

PoemGenerator is a simple demonstration of the LLM completions API. The user enters a poem topic and the LLM generates a full poem about the topic. 

## Installation
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
This app is an introduction to working with LLM completions API. See `LLMManager` for the LLM logic to generate the poem. 





