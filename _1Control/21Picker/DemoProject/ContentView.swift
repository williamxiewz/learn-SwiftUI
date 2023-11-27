//  互动教程合集：https://apps.apple.com/cn/app/id1392811165
//  Xcode互动教程免费下载地址：https://itunes.apple.com/cn/app/id1063100471
//  Swift语言入门实例互动教程免费下载地址：https://itunes.apple.com/cn/app/id1320746678
//  app开发中的神兵利器免费下载地址：https://itunes.apple.com/cn/app/id1209739676
//  Objective-C语言应用开发互动教程免费下载地址：https://apps.apple.com/cn/app/id838877136
//  Copyright © hdjc8.com. All rights reserved.

import SwiftUI

struct ContentView : View {
    
    var fruits = ["Apple", "Banner", "Pear", "Watermelon"]
    var colors = [Color.blue, Color.orange, Color.red, Color.purple]
    @State private var selectedItem = 0
    
    var body: some View {
        VStack {
            
            Picker(selection: $selectedItem, label: Text("Fruits")) {
                //ui
                ForEach(0 ..< fruits.count) {
                    Text(self.fruits[$0])
                        .tag($0)
                        .foregroundColor(self.colors[$0])
                }
            }
            
            Text("Your choice: ")
            +
            Text("\(fruits[selectedItem])")
                .foregroundColor(self.colors[selectedItem])
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
#endif
