//
//  ContentView.swift
//  TipCalculator
//
//  Created by Hana Kastrati on 3/3/25.
//

import SwiftUI

struct ContentView: View {
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
        VStack(){
            Text("Tip Calculator 💰")
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.top, 20)
            Spacer()
            
            VStack() {
                TextField("Enter bill amount", text: $billAmount)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Text("How much do you want to tip?")
                Picker("Tip Percentage", selection: $tipPercent){
                    ForEach(tipOptions, id: \.self){ tipPercent in
                        Text("\(tipPercent)%")
                    }
                }
                .pickerStyle(MenuPickerStyle())
                
                Spacer().frame(height: 15)
                
                Text("Your tip is: $\(tipAmount, specifier: "%.2f")")
                    .font(.body)
                
                Text("Your total is: $\(totalAmount, specifier: "%.2f")")
                    .font(.body)
            }
            .padding()
            Spacer()
        }
        
        
    }
}

#Preview {
    ContentView()
}
