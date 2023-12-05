/// Copyright (c) 2023 Kodeco
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct ToolbarButton: View {
  @Environment(\.verticalSizeClass) var verticalSizeClass
  let modal: ToolbarSelection
  private let modalButton: [
    ToolbarSelection: (text: String, imageName: String)
  ] = [
    .photoModal: ("Photos", "photo"),
    .frameModal: ("Frames", "square.on.circle"),
    .stickerModal: ("Stickers", "heart.circle"),
    .textModal: ("Text", "textformat")
  ]

  var body: some View {
    if let text = modalButton[modal]?.text,
      let imageName = modalButton[modal]?.imageName {
      if verticalSizeClass == .compact {
        compactView(imageName)
      } else {
        regularView(imageName, text)
      }
    }
  }

  func regularView(
    _ imageName: String,
    _ text: String
  ) -> some View {
    VStack(spacing: 2) {
      Image(systemName: imageName)
      Text(text)
    }
    .frame(minWidth: 60)
    .padding(.top, 5)
  }

  func compactView(_ imageName: String) -> some View {
    VStack(spacing: 2) {
      Image(systemName: imageName)
    }
    .frame(minWidth: 60)
    .padding(.top, 5)
  }
}

struct BottomToolbar: View {
  @EnvironmentObject var store: CardStore
  @Binding var card: Card
  @Binding var modal: ToolbarSelection?

  var body: some View {
    HStack(alignment: .bottom) {
      ForEach(ToolbarSelection.allCases) { selection in
        switch selection {
        case .photoModal:
          Button {
          } label: {
            PhotosModal(card: $card)
          }
        case .frameModal:
          defaultButton(selection)
            .disabled(
              store.selectedElement == nil
              || !(store.selectedElement is ImageElement))
        default:
          defaultButton(selection)
        }
      }
    }
  }

  func defaultButton(_ selection: ToolbarSelection) -> some View {
    Button {
      modal = selection
    } label: {
      ToolbarButton(modal: selection)
    }
  }
}

struct BottomToolbar_Previews: PreviewProvider {
  static var previews: some View {
    BottomToolbar(
      card: .constant(Card()),
      modal: .constant(.stickerModal))
    .padding()
    .environmentObject(CardStore())
  }
}
