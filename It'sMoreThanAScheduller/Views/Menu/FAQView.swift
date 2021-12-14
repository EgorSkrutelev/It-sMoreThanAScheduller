//
//  FAQView.swift
//  It'sMoreThanAScheduller
//
//  Created by Андрей Трофимов on 14.12.2021.
//

import SwiftUI

struct FAQView: View {
    var body: some View {
        VStack {
            VStack {
                Text("FAQ")
                    .font(.system(size: 34, weight: .heavy, design: .rounded))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
            }
            ScrollView {
                VStack {
                    Text("Зачем нужен этот календарь?")
                        .fontWeight(.heavy)
                        .padding([.top, .leading, .trailing])
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 20, weight: .heavy, design: .rounded))
                    Text("Чтобы о днях, часах и минутах думал и беспокоился телефон, а в голове у студента освободилось место для знаний. В нашем удобном приложении можно быстро сверится с расписанием пар, а также добавить информацию, например, о дате зачета или дэдлайне лабораторной работы.")
                        .padding()
                }
            }
        }
    }
}

struct FAQView_Previews: PreviewProvider {
    static var previews: some View {
        FAQView()
    }
}
