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
  
  // MARK: - BODY
  var body: some View {
    ZStack {
      Color("ColorBlue").ignoresSafeArea()
      VStack(spacing: 20.0) {
        
        // MARK: - Header
        Spacer()
        
        VStack(spacing: 0) {
          Text("Share.")
            .font(.system(size: 60))
            .fontWeight(.heavy)
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
        // MARK: - Center
        ZStack {
          CircleGroupView(color: .white, opacity: 0.2)
          Image("character-1")
            .resizable()
            .scaledToFit()
        } // Center
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
              .frame(width: 80)
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
            .onTapGesture {
              isOnboardingViewActive = false
            }
            Spacer()
          }
        } // Footer
        .frame(height: 80, alignment: .center)
        .padding()
      } // VStack
    } // ZStack
  }
}
// MARK: - PREVIEW
struct OnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingView()
  }
}
