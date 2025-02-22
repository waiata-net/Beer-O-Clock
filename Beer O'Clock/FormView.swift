//
//  FormView.swift
//  Beer O'Clock
//
//  Created by Neal Watkins on 21/02/2025.
//

import SwiftUI

struct FormView: View {
    
    @AppStorage("Work Time") var workTime = Time(hour: 9)
    @AppStorage("Beer Time") var beerTime = Time(hour: 17)
    
    var body: some View {
        VStack {
            Form {
                TimeField(label: "Start Work:", time: $workTime)
                TimeField(label: "Beer O'Clock:", time: $beerTime)
            }
            PintView()
                .frame(minHeight: 120)
        }
        .formStyle(.automatic)
        .frame(minWidth: 360)
        .padding()
    }
}

#Preview {
    FormView()
}
