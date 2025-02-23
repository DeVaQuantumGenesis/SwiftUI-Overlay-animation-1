import SwiftUI

import SwiftUI

struct ContentView: View {
    @State private var isOverlayVisible = false
    
    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    withAnimation {
                        isOverlayVisible.toggle()
                    }
                }) {
                    Text("オーバーレイ表示/非表示")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        .overlay(
            Group {
                if isOverlayVisible {
                    Color.black.opacity(0.4) // 半透明の背景
                        .ignoresSafeArea()
                        .transition(.opacity)
                        .zIndex(1)
                    
                    VStack {
                        Text("オーバーレイコンテンツ")
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 50)
                    .transition(.move(edge: .bottom))
                    .zIndex(2)
                }
            }
        )
    }
}
