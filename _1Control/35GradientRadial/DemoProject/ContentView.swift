//  互动教程合集：https://apps.apple.com/cn/app/id1392811165
//  Xcode互动教程免费下载地址：https://itunes.apple.com/cn/app/id1063100471
//  Swift语言入门实例互动教程免费下载地址：https://itunes.apple.com/cn/app/id1320746678
//  app开发中的神兵利器免费下载地址：https://itunes.apple.com/cn/app/id1209739676
//  Objective-C语言应用开发互动教程免费下载地址：https://apps.apple.com/cn/app/id838877136
//  Copyright © hdjc8.com. All rights reserved.

import SwiftUI

struct ContentView : View {
    
    var body: some View {
        Text("SwifUI Gradient")
            .font(.system(size: 36))
            .padding()
            .foregroundColor(.white)
            .background(RadialGradient(gradient: Gradient(colors: [.orange, .red, .purple]), center: .init(x: 0.5, y: 0.5), startRadius: CGFloat(10), endRadius: CGFloat(120)))
        
        
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    
    @State var txtFieldValue : String
    
    
    static var previews: some View {
        ContentView()
    }
}
#endif
