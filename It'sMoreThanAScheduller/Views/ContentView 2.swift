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
                    CalendarList(events: self.events) { event in
                        List {
                            ForEach(event.data, id:\.[0]) { subject in
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(subject[0])
                                        Text(subject[1]).font(.subheadline).foregroundColor(.gray)
                                    }
                                    Spacer()
                                    Text("Лекция")
                                }
                            }
                        }
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                    .disabled(self.showMenu ? true : false)
                    
                    if self.showMenu {
                        MenuView()
                            .frame(width: geometry.size.width/2)
                            .transition(.move(edge: .leading))
                    }
                }
                .gesture(drag)
            }
            .navigationBarTitle("Расписание", displayMode: .large)
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
        
        VStack {
            HStack(alignment: .center) {
                Button(action: {

                    // some haptic thing
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                }) {
                    Image(systemName: "gearshape")
                        .renderingMode(.original)
                        .padding()
                }
                .font(.system(size: 20, weight: Font.Weight.bold))
                .cornerRadius(14)
                .buttonStyle(PlainButtonStyle())

                Spacer()

                Text("Расписание")
                    .font(.system(size: 24, weight: .heavy))

                Spacer()

                Button(action: {

                    // some haptic thing
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                }) {
                    Image(systemName: "globe")
                        .renderingMode(.original)
                        .padding()
                }
                .font(.system(size: 20, weight: Font.Weight.bold))
                .cornerRadius(14)
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

struct SubjectRow: View {
    var subject: Subject
    
    var body: some View {
        HStack(alignment: .center) {
            Image("book")
                .resizable()
                .frame(width: 50, height: 50)
                .padding()
            Spacer()
            VStack(alignment: .leading) {
                Text(subject.name)
                Spacer()
                Text("В 8:20")
            }
            .padding()
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 10)
        .background(.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

