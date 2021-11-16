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
        
        // MARK: - Header
        
        Spacer()
        
        ZStack {
          CircleGroupView(color: .gray, opacity: 0.1)
          Image("character-2")
            .resizable()
            .scaledToFit()
          .padding()
        }
        
        // MARK: - Center
        Text("The time that leads to mastery is dependent on the intensity of our focus.")
          .font(.title3)
          .fontWeight(.light)
          .foregroundColor(.secondary)
          .multilineTextAlignment(.center)
          .padding()
        
        // MARK: - Footer
        
        Spacer()
        
        Button {
          isOnboardingViewActive = true
        } label: {
          Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
            .imageScale(.large)
          Text("Restart")
            .font(.system(.title3, design: .rounded))
            .fontWeight(.bold)
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
      } // VStack
    }
}
// MARK: - PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
