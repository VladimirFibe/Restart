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
      VStack(spacing: 20.0) {
        Text("Onboarding").font(.largeTitle)
        Button {
          isOnboardingViewActive = false
        } label: {
          Text("Start")
        }

      } // VStack
    }
}
// MARK: - PREVIEW
struct OnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingView()
  }
}
