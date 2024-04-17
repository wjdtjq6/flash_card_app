//
//  ContentView.swift
//  flah_card_app
//
//  Created by t2023-m0032 on 4/17/24.
//

import SwiftUI

struct ContentView: View {
    @State var showView: Bool = false
    @State var shouldDisapper = false
    var question = "질문"
    var answer = "답"
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    if showView {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(.black.gradient)
                            Text(answer)
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        }
                        .frame(width: 300, height: 400)
                        .transition(.reverseflip)
                    } else {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(.blue.gradient)
                            Text(question)
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        }
                        .frame(width: 300, height: 400)
                        .transition(.flip)
                    }
                }
                .frame(width: 300, height: 400)
                .onTapGesture {
                    shouldDisapper.toggle()
                    withAnimation(.easeInOut(duration: 0.8)) {
                        showView.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8){
                            shouldDisapper = false
                        }
                    }
                }
                
            }
            .navigationTitle("개발자를 위한 영단어")
        }
    }
}

#Preview {
    ContentView()
}

struct FlipTransition: ViewModifier, Animatable {
    var progress: CGFloat = 0
    var animatableData: CGFloat {
        get { progress }
        set { progress = newValue }
    }
    func body(content: Content) -> some View {
        content
            .opacity(progress < 0 ? (-progress < 0.9 ? 1 : 0) : (progress < 0.9 ? 1 : 0))
            .rotation3DEffect(
                .init(degrees: progress * 100),
                axis: (x: 0.0, y: 1.0, z: 0.0)
            )
    }
}

extension AnyTransition {
    static let flip: AnyTransition = .modifier(
        active: FlipTransition(progress: 1.8),
        identity: FlipTransition()
    )
    
    static let reverseflip: AnyTransition = .modifier(
        active: FlipTransition(progress: -1.8),
        identity: FlipTransition()
    )
}
