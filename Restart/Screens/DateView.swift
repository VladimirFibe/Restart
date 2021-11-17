//
//  DateView.swift
//  Restart
//
//  Created by Vladimir on 16.11.2021.
//

import SwiftUI

struct DateView: View {
  @State private var date = Date()
  var body: some View {
    VStack {
      DatePicker("Select day and time",
                 selection: $date,
                 displayedComponents: .date)
      Text(date, style: .date)
    }
    .environment(\.locale, Locale.init(identifier: "Ru_ru"))
    .padding()
  }
}

struct DateView_Previews: PreviewProvider {
  static var previews: some View {
    DateView()
  }
}
