//
//  HomeView.swift
//  Restart
//
//  Created by Vladimir on 15.11.2021.
//

import SwiftUI

struct HomeView: View {
  // MARK: - PROPERTY
  @AppStorage("onboarding") var isOnboardingViewActive: Bool?
  // MARK: - BODY
    var body: some View {
      VStack(spacing: 20.0) {
        Text("Home").font(.largeTitle)
        
        Button {
          isOnboardingViewActive = true
        } label: {
          Text("Restart")
        }
      } // VStack
    }
}
// MARK: - PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
