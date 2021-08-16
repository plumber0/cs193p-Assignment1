//
//  ContentView.swift
//  cs193p-Assignment1
//
//  Created by SeungWoo on 2021/08/16.
//

import SwiftUI

struct ContentView: View {
    @State var theme: [String] = ["1️⃣", "2️⃣", "🤚", "👶", "👧",
                                  "🧒", "👦", "👩", "🧑", "👨",
                                  "👩‍🦱", "🧑‍🦱", "👨‍🦱", "👩‍🦰", "🧑‍🦰"].shuffled()
    
    var humans = ["1️⃣", "2️⃣", "🤚", "👶", "👧",
                  "🧒", "👦", "👩", "🧑", "👨",
                  "👩‍🦱", "🧑‍🦱", "👨‍🦱", "👩‍🦰", "🧑‍🦰"]
    
    var animals = ["🐶", "🐱", "🐭", "🐹", "🐰",
                   "🦊", "🐻", "🐼", "🐻‍❄️", "🐨",
                   "🐯", "🦁", "🐮", "🐷", "🐽"]
    
    var fruits = ["🍏", "🍎", "🍐", "🍊", "🍋",
                  "🍌", "🍉", "🍇", "🍓", "🫐",
                  "🍈", "🍒", "🍑", "🥭", "🍍"]
    
    

    var body: some View {
        VStack{
            Text("Memorize!")
                .font(.largeTitle).foregroundColor(.blue)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(theme[0...theme.count], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
        Spacer()
        HStack {
            humanTheme
            Spacer()
            animalTheme
            Spacer()
            fruitTheme
        }
        .font(.largeTitle)
        .padding(.horizontal)
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        }
        .padding(.horizontal)
        .foregroundColor(.orange)
    }
    
    
    var humanTheme: some View {
        Button(action: {
            theme = humans.shuffled()
        }, label: {
            VStack {
                Image(systemName: "person.fill")
                Text("human")
            }
        })
    }
    
    var animalTheme: some View {
        Button {
            theme = animals.shuffled()
        } label: {
            VStack {
                Image(systemName: "hare.fill")
                Text("animal")
            }
        }
    }
    
    var fruitTheme: some View {
        Button {
            theme = fruits.shuffled()
        } label: {
            VStack {
                Image(systemName: "applelogo")
                Text("fruit")
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
