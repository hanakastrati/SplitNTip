//
//  ContentView.swift
//  TipCalculator
//
//  Created by Hana Kastrati on 3/3/25.
//

import SwiftUI

struct ContentView: View {
    //understand @state & private var
    @State private var billAmount = ""
    @State private var tipPercent = 15
    private let tipOptions = [10, 15, 18, 20, 25]
    
    var tipAmount: Double {
        //convert string to double
        let bill = Double(billAmount) ?? 0
        
        //calculate tip
        let tipValue = bill * (Double(tipPercent) / 100)
        
        //return values
        return tipValue
    }
    
    var totalAmount: Double {
        //convert string to double
        let bill = Double(billAmount) ?? 0
        //add tip to total for total amount
        let total = bill + tipAmount
        //return total amount
        return total

    }
    
    var body: some View {
        VStack {
            Text("Tip Calculator")
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
            
            TextField("Enter bill amount", text: $billAmount)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Picker("Tip Percentage", selection: $tipPercent){
                ForEach(tipOptions, id: \.self){ tipPercent in
                    Text("\(tipPercent)%")
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Text("Tip amount: $\(tipAmount, specifier: "%.2f")")
                .font(.body)
            
            Text("Total amount: $\(totalAmount, specifier: "%.2f")")
                .font(.body)
                .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
