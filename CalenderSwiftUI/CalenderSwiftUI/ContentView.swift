//
//  ContentView.swift
//  CalenderSwiftUI
//
//  Created by Kyle Wilson on 2020-10-26.
//

import SwiftUI

struct Month: Hashable {
    var month: String
    var days: Int
    var firstDayIndex: Int
}

struct Day: Equatable {
    var day: Int
    var month: String
}
 
var months: [Month] = [
    Month(month: "January", days: 31, firstDayIndex: 4),
    Month(month: "February", days: 29, firstDayIndex: 7),
    Month(month: "March", days: 31, firstDayIndex: 1),
    Month(month: "April", days: 30, firstDayIndex: 4),
    Month(month: "May", days: 31, firstDayIndex: 6),
    Month(month: "June", days: 30, firstDayIndex: 2),
    Month(month: "July", days: 31, firstDayIndex: 4),
    Month(month: "August", days: 31, firstDayIndex: 7),
    Month(month: "September", days: 30, firstDayIndex: 3),
    Month(month: "October", days: 31, firstDayIndex: 5),
    Month(month: "November", days: 30, firstDayIndex: 1),
    Month(month: "December", days: 31, firstDayIndex: 3)
]

var days: [String] = ["S", "M", "T", "W", "T", "F", "S"]

struct ContentView: View {
    
    var body: some View {
        VStack {
            HStack(spacing: 20.5) {
                ForEach(days, id: \.self) { day in
                    Text(day)
                        .bold()
                        .frame(minWidth: 25, minHeight: 25)
                }
            }
            ScrollView {
                MonthView(selectedDay: nil)
                    .padding()
            }
        }.padding()
    }
    
}

struct MonthView: View {

    @State var selectedDay: Day?

    var body: some View {
        VStack {
            ForEach(months, id: \.self) { month in
                Text("\(month.month)")
                    .bold()
                LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                    ForEach(1...month.days + month.firstDayIndex - 1, id: \.self) { day in
                        if day >= month.firstDayIndex {
                            Text("\(day - (month.firstDayIndex - 1))")
                                .frame(minWidth: 25, minHeight: 25)
                                .onTapGesture {
                                    self.selectedDay = Day(day: day, month: month.month)
                                }
                                .background(Day(day: day, month: month.month) == self.selectedDay ? Color.red : Color.clear)
                        } else {
                            Spacer()
                        }
                    }
                }
                Divider()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
