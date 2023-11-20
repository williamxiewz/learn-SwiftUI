//  互动教程合集：https://apps.apple.com/cn/app/id1392811165
//  Xcode互动教程免费下载地址：https://itunes.apple.com/cn/app/id1063100471
//  Swift语言入门实例互动教程免费下载地址：https://itunes.apple.com/cn/app/id1320746678
//  app开发中的神兵利器免费下载地址：https://itunes.apple.com/cn/app/id1209739676
//  Objective-C语言应用开发互动教程免费下载地址：https://apps.apple.com/cn/app/id838877136
//  Copyright © hdjc8.com. All rights reserved.

import SwiftUI

struct ContentView : View {
    
     @State var temperature: Double = 0

       var body: some View {
           VStack {
                Slider(value: $temperature)
                Slider(value: $temperature, in: -20...40)
                Slider(value: $temperature, in: -20...40) { (item) in
                    print(item)
                }
                HStack{
                    Image(systemName: "sun.max")

                    Slider(value: $temperature, in: -20...40, step: 2) { (item) in
                        print(item)
                    }.accentColor(.pink).colorInvert()
                    
                   Image(systemName: "sun.max.fill")
                }.padding()

                Text("The temperature is \(Int(temperature)).")
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
