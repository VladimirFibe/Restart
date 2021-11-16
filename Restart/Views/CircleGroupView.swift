//
//  CircleGroupView.swift
//  Restart
//
//  Created by Vladimir on 16.11.2021.
//

import SwiftUI

struct CircleGroupView: View {
  @State var color: Color
  @State var opacity: Double
    var body: some View {
      ZStack {
        Circle()
          .stroke(color.opacity(opacity), lineWidth: 40)
          .frame(width: 260, height: 260, alignment: .center)
        Circle()
          .stroke(color.opacity(opacity), lineWidth: 80)
          .frame(width: 260, height: 260, alignment: .center)
      }
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
      ZStack {
        Color("ColorBlue").ignoresSafeArea()
        CircleGroupView(color: .white, opacity: 0.2)
      }
      
    }
}
