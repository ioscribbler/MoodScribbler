# MoodScribbler

## 📋 <a name="table">Table of Contents</a>

1. 📝 [Introduction](#introduction)
2. 🛠️ [Tech Stack](#tech-stack)
3. 🌟 [Features](#features)
4. 📦 [Snippets (Code to Copy)](#snippets)
5. ⚓ [Conclusion](#conclusion)

## 🚀 Tutorial

This repository contains the code for an in-depth tutorial available on our YouTube channel, <a href="https://www.youtube.com/@ioscribbler/videos" target="_blank"><b>ioscribbler</b></a>.

If you prefer learning through visual content, we got you covered. Watch our tutorial to learn how to create Mobile project like this one in a step-by-step manner that's easy to understand for everyone!

## <a name="introduction">📝 Introduction</a>
This is a SwiftUI application called **Mood Scribbler**. It is a journaling app designed to demonstrate good architecture, best practices, and various design patterns that can assist you in building an effective CRUD application.

## <a name="tech-stack">🛠️ Tech Stack</a>
- Swift
- SwiftUI
- XCode as IDE
 
## <a name="features">🌟 Features</a>
➡️ **Add Journal Content**: Allows users to input their thoughts and experiences into the app.

➡️ **Rate the Mood on a Specific Date**: Users can express their emotional state for any given day.

➡️ **Fetch Journal Entries**: Users can retrieve their past journal entries for reflection.

➡️ **Create Journal Entry**: Enables patients to document their feelings and experiences as needed.

➡️ **Update Journal Entry**: Allows users to edit existing entries for accuracy or additional thoughts.

➡️ **Delete Journal Entry**: Users can remove entries they no longer wish to keep.

## <a name="snippets">📦 Snippets(Code to Copy)</a>

<details>
<summary><code>PreviewMockDataHelper.swift</code></summary>
<br>
 
```swift
import Foundation

enum PreviewMockDataHelper {
    static let journalEntry: JournalEntry = .init(
        postDate: Date(),
        content: "A very happy and interesting journal entry das dasd as dasd as das a A very happy and interesting journal entry das dasd as dasd as das a",
        wellBeingRating: 3
    )

    static let journalEntries: [JournalEntry] = [
        .init(postDate: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, content: "A very happy and interesting journal entry", wellBeingRating: 3),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -2, to: Date())!, content: "A day of reflection and solitude", wellBeingRating: 1),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -12, to: Date())!, content: "Watched a great movie and relaxed for couple of hours before going out with my best friends from childhood", wellBeingRating: 4),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -3, to: Date())!, content: "Spent time with friends, feeling energized", wellBeingRating: 4),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -5, to: Date())!, content: "A productive day at work", wellBeingRating: 3),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -7, to: Date())!, content: "Feeling a bit under the weather", wellBeingRating: 2),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -9, to: Date())!, content: "Enjoyed a peaceful morning walk", wellBeingRating: 4),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -10, to: Date())!, content: "A challenging day, but managed to stay positive", wellBeingRating: 3),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -14, to: Date())!, content: "Had a stressful meeting, but resolved things", wellBeingRating: 2),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -15, to: Date())!, content: "A fantastic day of exploration and fun", wellBeingRating: 5),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -16, to: Date())!, content: "Started a new hobby, feeling excited", wellBeingRating: 5),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -17, to: Date())!, content: "A quiet day of reading and rest", wellBeingRating: 3),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -18, to: Date())!, content: "Tough workday, feeling drained", wellBeingRating: 2),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -20, to: Date())!, content: "Caught up with old friends, lots of laughs", wellBeingRating: 4),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -21, to: Date())!, content: "Rainy day, but enjoyed it", wellBeingRating: 3),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -23, to: Date())!, content: "Focused on personal growth, feeling proud", wellBeingRating: 5),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -25, to: Date())!, content: "Felt stressed about deadlines", wellBeingRating: 2),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -26, to: Date())!, content: "Had a long, relaxing walk in the park", wellBeingRating: 4),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -27, to: Date())!, content: "A challenging day but full of learning", wellBeingRating: 3),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -28, to: Date())!, content: "Spent time cooking a new recipe, delicious!", wellBeingRating: 5)
    ]

    static let fewJournalEntries: [JournalEntry] = [
        .init(postDate: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, content: "A very happy and interesting journal entry", wellBeingRating: 3),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -2, to: Date())!, content: "A day of reflection and solitude", wellBeingRating: 1),
        .init(postDate: Calendar.current.date(byAdding: .day, value: -12, to: Date())!, content: "Watched a great movie and relaxed for a couple of hours before going out with my best friends from childhood", wellBeingRating: 4)
    ]
}
```
</details>

<details>
<summary><code>AppColorTheme.swift</code></summary>
<br>
 
```swift
import Foundation
import SwiftUI

enum AppColorTheme {
    static let backgroundColor: Color = Color("BackgroundColor")
    static let secondaryTextColor: Color = Color("SecondaryTextColor")
    static let secondaryBackgroundColor: Color = Color("SecondaryBackgroundColor")
    static let whiteColor: Color = Color("WhiteColor")
    static let accentColor: Color = Color("AccentColor")
}

```
</details>

<details>
<summary><code>CustomFont.swift</code></summary>
<br>
 
```swift
import Foundation
import SwiftUI

enum CustomFont {
    static let title = Font.custom("Poppins-Regular", size: 32)
    static let subtitle = Font.custom("Poppins-Regular", size: 24)
    static let body = Font.custom("Poppins-Regular", size: 16)
    static let callout = Font.custom("Poppins-Regular", size: 14)
    static let caption = Font.custom("Poppins-Regular", size: 12)
}
```
</details>

## <a name="conclusion"> 🤖 Conclusion</a>
I hope this tutorial aids in your professional growth and deepens your understanding in this field. If you found this helpful, consider following or subscribing to support the continuation of this content.

🪶 Happy Scribbling!
