//
//  OnboardingView.swift
//  Restart
//
//  Created by Vladimir on 15.11.2021.
//

import SwiftUI

struct OnboardingView: View {
  // MARK: - PROPERTY
  @AppStorage("onboarding") var isOnboardingViewActive: Bool?
  @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
  @State private var buttonOffset: CGFloat = 0.0
  @State private var isAnimating = false
  @State private var imageOffset: CGSize = .zero
  @State private var indicatorOpacity = 1.0
  @State private var textTitle = "Share."
  let hapticFeedback = UINotificationFeedbackGenerator()
  // MARK: - BODY
  var body: some View {
    ZStack {
      Color("ColorBlue").ignoresSafeArea()
      VStack(spacing: 20.0) {
        
        // MARK: - Header
        Spacer()
        
        VStack(spacing: 0) {
          Text(textTitle)
            .font(.system(size: 60))
            .fontWeight(.heavy)
            .transition(.opacity)
            .id(textTitle)
          Text("""
            It's not how much we give but
            how much love we put into giving.
            """)
            .font(.title3)
            .fontWeight(.light)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 10)
        } // Header
        .foregroundColor(.white)
        .opacity(isAnimating ? 1 : 0)
        .offset(y: isAnimating ? 0 : -40)
        .animation(.easeOut(duration: 1), value: isAnimating )
        // MARK: - Center
        ZStack {
          CircleGroupView(color: .white, opacity: 0.2)
            .offset(x: -imageOffset.width)
            .blur(radius: abs(imageOffset.width / 5))
            .animation(.easeOut(duration: 1), value: imageOffset)
          
          Image("character-1")
            .resizable()
            .scaledToFit()
            .opacity(isAnimating ? 1 : 0)
            .animation(.easeOut(duration: 0.5), value: isAnimating )
            .offset(x: imageOffset.width * 1.2)
            .rotationEffect(.degrees(imageOffset.width / 20))
            .gesture(
            DragGesture()
              .onChanged { value in
                if abs(imageOffset.width) < 150 {
                  imageOffset = value.translation
                  
                  withAnimation(.linear(duration: 0.25)) {
                    indicatorOpacity = 0
                    textTitle = "Give."
                  }
                }
              }
              .onEnded { _ in
                imageOffset = .zero
                
                withAnimation(.linear(duration: 0.25)) {
                  indicatorOpacity = 1
                  textTitle = "Share."
                }
              }
            )
            .animation(.easeOut(duration: 1), value: imageOffset)
        } // Center
        .overlay(
        Image(systemName: "arrow.left.and.right.circle")
          .font(.system(size: 44, weight: .ultraLight))
          .foregroundColor(.white)
          .offset(y: 20)
          .opacity(isAnimating ? 1 : 0)
          .animation(.easeOut(duration: 1).delay(2), value: isAnimating)
          .opacity(indicatorOpacity)
        , alignment: .bottom)
        Spacer()
        // MARK: - Footer
        
        ZStack {
          Capsule()
            .fill(.white.opacity(0.2))
          Capsule()
            .fill(.white.opacity(0.2))
            .padding(8)
          
          Text("Get Started")
            .font(.system(.title3, design: .rounded))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .offset(x: 20)
          HStack {
            Capsule()
              .fill(Color("ColorRed"))
              .frame(width: 80 + buttonOffset)
            Spacer()
          }
          HStack {
            ZStack {
              Circle()
                .fill(Color("ColorRed"))
              Circle()
                .fill(.black.opacity(0.15))
                .padding(8)
              Image(systemName: "chevron.right.2")
                .font(.system(size: 24, weight: .bold))
            }
            .foregroundColor(.white)
            .frame(width: 80, height: 80, alignment: .center)
            .offset(x: buttonOffset)
            .gesture(
              DragGesture()
                .onChanged { value in
                  let width = value.translation.width
                  if width > 0 && buttonOffset <= buttonWidth - 80 {
                    buttonOffset = width
                  }
                }
                .onEnded{ _ in
                  withAnimation(.easeOut(duration: 0.4)) {
                    if buttonOffset > buttonWidth / 2 {
                      hapticFeedback.notificationOccurred(.success)
                      playSound(sound: "chimeup", type: "mp3")
                      buttonOffset = buttonWidth - 80
                      isOnboardingViewActive = false
                    } else {
                      hapticFeedback.notificationOccurred(.warning)
                      buttonOffset = 0
                    }
                  }
                }
            )
            Spacer()
          }
        } // Footer
        .frame(width: buttonWidth, height: 80, alignment: .center)
        .padding()
        .opacity(isAnimating ? 1 : 0)
        .offset(y: isAnimating ? 0 : 40)
        .animation(.easeOut(duration: 1), value: isAnimating )
      } // VStack
    } // ZStack
    .onAppear {
      isAnimating = true
    }
    .preferredColorScheme(.dark)
  }
}
// MARK: - PREVIEW
struct OnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingView()
  }
}
