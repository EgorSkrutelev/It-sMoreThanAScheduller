//
//  ContentView.swift
//  It'sMoreThanAScheduller
//
//  Created by Roman Rakhlin on 25.11.2021.
//

import SwiftUI

struct ContentView: View {
    
    var events = [
        CalendarEvent(dateString: "11/25/2021", data: [["Матеша", "8:20"], ["Инфа", "8:20"], ["Инглиш", "8:20"], ["Кроссфит", "8:20"]]),
    ]
    
    @State var showMenu = false
    
    var body: some View {
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        self.showMenu = false
                    }
                }
            }
    
        return NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    // calndar view
                    CalendarList(events: self.events) { event in
                        // list with schedule
                        List {
                            ForEach(event.data, id:\.[0]) { subject in
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(subject[0])
                                            .font(.system(size: 20, weight: .bold, design: .rounded))
                                        Text(subject[1])
                                            .font(.system(size: 18, weight: .light, design: .rounded))
                                    }
                                    Spacer()
                                    Text("Лекция")
                                        .font(.system(size: 18, weight: .bold, design: .rounded))
                                }
                            }
                            .listRowBackground(Color.gray.opacity(0.4))
                        }
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                    .disabled(self.showMenu ? true : false)
                    
                    // left side menu
                    if self.showMenu {
                        MenuView()
                            .frame(width: geometry.size.width/2)
                            .transition(.move(edge: .leading))
                    }
                }
                .gesture(drag)
            }
            .navigationBarTitle("Расписание 📚", displayMode: .large)
            .navigationBarItems(leading: (
                Button(action: {
                    withAnimation {
                        self.showMenu.toggle()
                    }
                    
                    // some haptic thing
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                }) {
                    Image(systemName: "gearshape")
                        .imageScale(.large)
                }
            ))
            .navigationBarItems(trailing: (
                Button(action: {
                    print("SHOW PICKER HERE")
                    
                    // some haptic thing
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                }) {
                    Image(systemName: "globe")
                        .imageScale(.large)
                })
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

