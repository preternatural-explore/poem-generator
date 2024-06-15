> [!IMPORTANT]
> Created by [Preternatural AI](https://preternatural.ai/), an exhaustive client-side AI infrastructure for Swift.<br/>
> This project and the frameworks used are presently in alpha stage of development.

# Poem Generator: Personalized poetry, anytime, any topic!

PoemGenerator is a simple demonstration of the LLM completions API. The user enters a poem topic and the LLM generates a full poem about the topic. 
<br/><br/>
[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://github.com/PreternaturalAI/AI/blob/main/LICENSE)

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

## Table of Contents
- [Key Concepts](#key-concepts)
- [Preternatural Frameworks](#preternatural-frameworks)
- [License](#license)

## Key Concepts
This app is an introduction to working with LLM completions API. See `LLMManager` for the LLM logic to generate the poem. 

## Preternatural Frameworks
The following Preternatural Frameworks were used in this project: 
- [AI](https://github.com/PreternaturalAI/AI): The definitive, open-source Swift framework for interfacing with generative AI.
- [SwiftUIZ](https://github.com/SwiftUIX/SwiftUIZ): A framework to support ambitious expansions to SwiftUI.

# License

This package is licensed under the [MIT License](https://github.com/PreternaturalAI/AI/blob/main/LICENSE).




