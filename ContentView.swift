//
//  ContentView.swift
//  GridDemo
//
//  Created by Karan Pal on 29/06/20.
//

import SwiftUI

struct ContentView: View {
  // Our list of Emoji
  let emojiList: [String] = Emoji.emoji
  
  // Columns for Grid
//  let columns : [GridItem] = [
//    GridItem(.adaptive(minimum: 60), spacing: 1)
//  ]
  
  var columns : [GridItem] {
    Array(repeating: .init(.flexible(minimum: 60), spacing: 1), count: 34)
  }
  
  var body: some View {
    NavigationView {
      // Scrolling direction changed
      ScrollView(.vertical, showsIndicators: false) {
          ScrollView(.horizontal, showsIndicators: false) {
            
            // Grid type changed, and parameter name too
            LazyHGrid(rows: columns, spacing: 1) {
              // Iterating emojis
             	
              ForEach(emojiList.shuffled(), id: \.self) { emoji in
                  ZStack {
                    Rectangle().stroke(Color.black, lineWidth: 0.5)
                    Text(emoji)
                      .font(.system(size: 40))

                  } //: ZSTACK
                  .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
  //                  .background(
  //                    Rectangle().stroke(Color.gray, lineWidth: 1)
  //                  )
                }
              
            } //: LAZYHGRID
            .padding(.all, 6) // Padding added, "Enhancement".
            .frame(minWidth: 700, maxWidth: .infinity, minHeight: 700, maxHeight: .infinity, alignment: .center)
          } //: SCROLLVIEW
          
      }
      .navigationBarTitle("Smileys")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
