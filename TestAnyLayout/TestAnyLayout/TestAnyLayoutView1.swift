//
//  TestAnyLayoutView1.swift
//  TestAnyLayout
//
//  Created by 苏州丰源天下传媒 on 2022/11/27.
//

import SwiftUI

// 学习 环境变量 horizontalSizeClass
// 学习 AnyLayout
struct TestAnyLayoutView1: View {
   // 测试模拟器
   @Environment(\.horizontalSizeClass) var horizontalSizeClass
   
   var body: some View {
       let layout = horizontalSizeClass == .regular ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
       
       return layout {
           Image(systemName: "airplane.departure")
           Image(systemName: "airplane.departure")
           Image(systemName: "airplane.departure")
       }
       .font(.largeTitle)
   }
}


#Preview {
    TestAnyLayoutView1()
}
