//
//  ContentView.swift
//  cs193p-Assignment1
//
//  Created by SeungWoo on 2021/08/16.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["1️⃣", "2️⃣", "🤚", "👶", "👧",
                  "🧒", "👦", "👩", "🧑", "👨",
                  "👩‍🦱", "🧑‍🦱", "👨‍🦱", "👩‍🦰", "🧑‍🦰",
                  "👨‍🦰", "👱‍♀️", "👱", "👱‍♂️", "👩‍🦳",
                  "🧑‍🦳", "👨‍🦳", "👩‍🦲", "🧑‍🦲"]
    
    @State var emojiCount = 20
    

    var body: some View {
        VStack{
            Text("Memorize!")
                .font(.largeTitle).foregroundColor(.blue)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
        Spacer()
        HStack {
            remove
            Spacer()
            add
        }
        .font(.largeTitle)
        .padding(.horizontal)
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        }
        .padding(.horizontal)
        .foregroundColor(.orange)
    }
    
    
    var remove: some View {
        Button(action: {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        }, label: {
            VStack {
                Image(systemName: "minus.circle")
            }
        })
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            VStack {
                Image(systemName: "plus.circle")
            }
        }
    }
}










struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            
            if isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture(perform: {
            isFaceUp = !isFaceUp
        })
    }
}





















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
