//
//  EmojiPickerView.swift
//  Habbits
//
//  Created by Ji y LEE on 5/15/25.
//

import SwiftUI


let emojiCategories:[String:[String]] = [
    "Sports": ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏉", "🥏", "🏓", "🏸",
               "🥅", "⛳️", "🏹", "🎣", "🤿", "🥊", "🥋", "🎽", "🛹", "🛼",
               "🛷", "⛷️", "🏂", "🏋️‍♂️", "🏋️‍♀️", "🤼‍♂️", "🤼‍♀️", "🤸‍♂️", "🤸‍♀️", "🤾‍♂️",
               "🤾‍♀️", "🚴‍♂️", "🚴‍♀️", "🚵‍♂️", "🚵‍♀️", "🧗‍♂️", "🧗‍♀️", "🏊‍♂️", "🏊‍♀️", "🏄‍♂️",
               "🏄‍♀️", "🤽‍♂️", "🤽‍♀️", "🏇", "🎿", "🏌️‍♂️", "🏌️‍♀️", "🪂", "🛶", "🏆",
               "🥇", "🥈", "🥉", "🎖️", "🏅", "🎗️", "🎯", "🎳", "🎮", "🕹️",
               "♟️", "🏏", "🏑", "🏒", "🥍", "🥌", "⛸️", "🎣", "🏹", "🚣‍♂️",
               "🚣‍♀️", "🛷", "🛼", "🤿", "🎽", "🎯", "🤾", "🏋️", "🤸", "🤼",
               "🏌️", "🪂", "🏇", "🧗", "🚴", "🚵", "🏊", "🏄", "🤽", "🏂",
               "⛷️", "🛹", "🏉", "🏐", "🎾", "🏀", "⚽️", "🏈", "⚾️", "🥅"],
    
    "Hobbies": [ "🎨", "🖌️", "🖍️", "🧵", "🪡", "🪢", "🧶", "📸", "📷", "📹",
                 "🎥", "🎬", "🎞️", "🎭", "🎼", "🎧", "🎤", "🎷", "🎸", "🎺",
                 "🎻", "🥁", "🎮", "🕹️", "🎲", "🎯", "🧩", "♟️", "🎳", "🏓",
                 "🏸", "🥅", "🏀", "⚽️", "🏈", "⚾️", "🎾", "🏐", "🏉", "🥏",
                 "🛹", "🛼", "🚴‍♂️", "🚴‍♀️", "🚵‍♂️", "🚵‍♀️", "🧗‍♂️", "🧗‍♀️", "🏊‍♂️", "🏊‍♀️",
                 "🏄‍♂️", "🏄‍♀️", "🤿", "🚣‍♂️", "🚣‍♀️", "🛶", "🪂", "🏇", "🚵", "🚴",
                 "🧗", "🎿", "🏂", "⛷️", "🏌️‍♂️", "🏌️‍♀️", "🏕️", "🌄", "🌅", "🏞️",
                 "🧘‍♂️", "🧘‍♀️", "🪴", "🌻", "🌷", "🌹", "🌼", "🍀", "🎋", "🎍",
                 "🎑", "🎇", "🎆", "✨", "🎉", "🎊", "🎁", "🎀", "🎈", "🪄",
                 "📚", "📖", "📝", "✏️", "🖋️", "🖊️", "📒", "📓", "📔", "📕"],
    
    "Study": ["📚", "📖", "📝", "✏️", "🖋️", "🖊️", "🖍️", "📓", "📒", "📔",
              "📕", "📗", "📘", "📙", "📄", "📃", "📑", "📜", "📋", "📇",
              "🗂️", "🗃️", "🗄️", "🗒️", "🗓️", "📅", "📆", "🔖", "🔗", "📎",
              "🖇️", "✂️", "📐", "📏", "📌", "📍", "📤", "📥", "📦", "📫",
              "📪", "📬", "📭", "📮", "🗳️", "💼", "📁", "📂", "🗒️", "🔏",
              "🔐", "🔑", "🧾", "📄", "📃", "📑", "📜", "📋", "📇", "🗂️",
              "🗃️", "🗄️", "🗒️", "🗓️", "📅", "📆", "🔖", "🔗", "📎", "🖇️",
              "✂️", "📐", "📏", "📌", "📍", "📤", "📥", "📦", "📫", "📪",
              "📬", "📭", "📮", "🗳️", "💼", "📁", "📂", "🗒️", "📚", "📖",
              "📝", "✏️", "🖋️", "🖊️", "🖍️", "📓", "📒", "📔", "📕", "📗"],
    
    "Instruments": ["🎸", "🎹", "🥁", "🎷", "🎺", "🎻", "🎤", "🎧", "🎼", "🎵",
                    "🎶", "🎙️", "📻", "📯", "🎚️", "🎛️", "🪕", "🪗", "🪘", "🪈",
                    "🎷", "🎺", "🎸", "🎻", "🥁", "🪕", "🪗", "🪘", "🪈", "🎧",
                    "🎤", "🎵", "🎶", "🎼", "🎙️", "📻", "📯", "🎚️", "🎛️", "🎸",
                    "🎹", "🎷", "🎺", "🎻", "🥁", "🪕", "🪗", "🪘", "🪈", "🎧",
                    "🎤", "🎵", "🎶", "🎼", "🎙️", "📻", "📯", "🎚️", "🎛️", "🎸",
                    "🎹", "🎷", "🎺", "🎻", "🥁", "🪕", "🪗", "🪘", "🪈", "🎧",
                    "🎤", "🎵", "🎶", "🎼", "🎙️", "📻", "📯", "🎚️", "🎛️", "🎸",
                    "🎹", "🎷", "🎺", "🎻", "🥁", "🪕", "🪗", "🪘", "🪈", "🎧",
                    "🎤", "🎵", "🎶", "🎼", "🎙️", "📻", "📯", "🎚️", "🎛️", "🎸"]



    

]











struct EmojiPickerView: View {
    @Binding var selectedEmoji: String
    @Environment(\.dismiss) var dismiss
    
    let categories = ["All", "Sports", "Instruments", "Hobbies", "Study"]
    @State private var selectedCategory = "All"

    var body: some View {
        NavigationStack {
            VStack {
                Picker("Category", selection: $selectedCategory) {
                    ForEach(categories, id: \.self) { category in
                        Text(category)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                // ✅ 이 부분이 핵심
                let allEmojis = emojiCategories.values.flatMap { $0 }
                let emojis = selectedCategory == "All" ? allEmojis : (emojiCategories[selectedCategory] ?? [])
                let columns = Array(repeating: GridItem(.flexible()), count: 5)

                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        
                        ForEach(Array(emojis.enumerated()), id: \.offset) { index, emoji in
                            Button {
                                selectedEmoji = emoji
                                dismiss()
                            } label: {
                                Text(emoji)
                                    .font(.system(size: 32))
                                    .padding(8)
                            }
                        }

                        
                        
//                        ForEach(emojis, id: \.self) { emoji in
//                            Button {
//                                selectedEmoji = emoji
//                                dismiss()
//                            } label: {
//                                Text(emoji)
//                                    .font(.system(size: 32))
//                                    .padding(8)
//                            }
//                        }
                    }
                    .padding()
                }
            }
//            .navigationTitle("Emoji Picker")
        }
    }
}



#Preview {
    @Previewable @State var dummyEmoji = "😀"
       return EmojiPickerView(selectedEmoji: $dummyEmoji)
}
