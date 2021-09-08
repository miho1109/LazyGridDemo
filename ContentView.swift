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
  
  var rows : [GridItem] {
    Array(repeating: .init(.flexible(minimum: 60), spacing: 1), count: 34)
  }
  
  var columnTitle = [
    GridItem(.flexible(minimum: 80))
  ]
  
  var rowTitle = [
    GridItem(.flexible(minimum: 80))
  ]
  
  
  var body: some View {
    NavigationView {
      // Scrolling direction changed
      VStack(alignment: .leading) {
        Text("""
          a
          b
          c
          d
          """)
          .padding()
          .border(Color.black)
        
        ScrollView([.vertical, .horizontal] , showsIndicators: true) {
          
          VStack(alignment: .leading, spacing: 1) {
            // COLUMN TITLE
            LazyHStack(spacing: 1) {
              Rectangle().stroke(Color.black, lineWidth: 0.5)
                .frame(minWidth: 119, maxWidth: .infinity, minHeight: 60, idealHeight: 60, maxHeight: 60, alignment: .center)
              
              LazyHGrid(rows: columnTitle, spacing: 1){
                ForEach(0 ..< 120) { item in
                  ZStack {
                    Rectangle().stroke(Color.black, lineWidth: 0.5)
                    Text("Column Title")
//                      .font(.system(size: 40))
                  } //: ZSTACK
                  .frame(minWidth: 119, maxWidth: .infinity, minHeight: 60, idealHeight: 60, maxHeight: 60, alignment: .center)
                } //: LOOP
              }
            } //: HGRID
            
            // ROW TITLE
            LazyHStack(alignment: .top, spacing: 1) {
              LazyVGrid(columns: rowTitle, spacing: 1){
                ForEach(0 ..< 34) { item in
                  ZStack {
                    Rectangle().stroke(Color.black, lineWidth: 0.5)
                    Text("Row Title")
//                      .font(.system(size: 40))
                  } //: ZSTACK
                  .frame(minWidth: 119, maxWidth: .infinity, minHeight: 60, idealHeight: 60, maxHeight: 60, alignment: .center)
                } //: LOOP
              } //: HGRID
              
              //TABLE CONTENT 34:120
              LazyHGrid(rows: rows, spacing: 1) {
                // Iterating emojis
                ForEach(emojiList.shuffled(), id: \.self) { emoji in
                    ZStack {
                        Rectangle().stroke(Color.black, lineWidth: 0.5)
                        Text(emoji)
//                              .font(.system(size: 40))
                    } //: ZSTACK
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                  } //: LOOP
              } //: GRID
              .frame(minWidth: 700, maxWidth: .infinity, minHeight: 700, maxHeight: .infinity, alignment: .center)
            } //: HSTACK
          } //: VSTACK
        } //: SCROLLVIEW
        .navigationBarTitle("Table 34:102")
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .previewDevice("iPhone 11")
  }
}
