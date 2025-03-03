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
    @State private var isSplitting = false
    @State private var splitCount = ""
    private let tipOptions = [5, 10, 15, 18, 20, 25]
    
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
        if isSplitting == false {
            //change from string to double type
            let bill = Double(billAmount) ?? 0
            //add tip to total for total amount
            let total = bill + tipAmount
            //return total amount
            return total
        } else {
            let bill = Double(billAmount) ?? 0
            let people = Double(splitCount) ?? 1
            let total = (bill + tipAmount)/people
            
            return total
        }
        
    }
    var body: some View {
        ZStack(){
            Color("AccentColor")
                .edgesIgnoringSafeArea(.all)
            VStack(){
                Text("Tip Calculator 💰")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
                Spacer()
                
                VStack() {
                    Text("Enter bill amount below.")
                    TextField("Bill amount", text: $billAmount)
                        .frame(width: 100)
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
                    
                    Divider()
                    Spacer().frame(height: 20)
                    // add yes/no button. if no is selected it just shows tip & total. if yes is selected it asks for input on how many people then shows "per person total"
                    Text("Are you splitting the bill?")
                    Picker("Splitting bill?", selection: $isSplitting){
                        Text("No").tag(false)
                        Text("Yes").tag(true)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 150)
                    .padding()
                    if isSplitting {
                        Text("How many people are splitting?")
                        
                        TextField("Enter number of people", text: $splitCount)
                            .keyboardType(.numberPad) // Ensures only numbers can be entered
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 75)
                            .padding()
                    }

                    if isSplitting == false {
                        Text("Your total is: $\(totalAmount, specifier: "%.2f")")
                            .font(.body)
                    } else {
                        
                        Text("Each person pays: $\(totalAmount, specifier: "%.2f")")
                            .font(.body)
                    }
                }
                .padding()
                Spacer()
            }
            .contentShape(Rectangle()) // Ensures the whole area is tappable
                .onTapGesture {
                    hideKeyboard()
                }
        }
    }
}
        
//extension to hide keyboard
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    ContentView()
}
