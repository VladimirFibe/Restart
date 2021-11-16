//
//  ContentView.swift
//  Restart
//
//  Created by Vladimir on 14.11.2021.
//

import SwiftUI

struct ContentView: View {
  @AppStorage("onboarding") var isOnboardingViewActive = true
  var body: some View {
    if isOnboardingViewActive {
      OnboardingView()
    } else {
      HomeView()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
