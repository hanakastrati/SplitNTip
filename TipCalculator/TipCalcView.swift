//
//  TipCalcView.swift
//  TipCalculator
//
//  Created by Hana Kastrati on 3/7/25.
//

import SwiftUI

struct TipCalcView: View {
	
	@State private var billAmount = ""
	@State private var tipPercent = 20
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
	} //var tip amount
	
	var totalAmount: Double {
		if isSplitting == false {
			//change from string to double type
			let bill = Double(billAmount) ?? 0
			//add tip to total for total amount
			let total = bill + tipAmount
			//return total amount
			return total
		} else {
			let bill = Double(billAmount) ?? 0
			let people = max(Double(splitCount) ?? 1, 1) //error handling for 0
			let total = (bill + tipAmount)/people
			
			return total
		}
	} // var total amt
	
	var body: some View {
		VStack(){
			//page title
			Text("Tip Calculator💰")
				.font(.largeTitle)
				.bold()
				.multilineTextAlignment(.center)
				.padding(.top, 20)
			Spacer()
			
			//enter bill amount
			Text("Enter bill total below.")
			TextField("Bill Amount", text: $billAmount)
				.frame(width: 100)
				.keyboardType(.decimalPad)
				.textFieldStyle(RoundedBorderTextFieldStyle())
				.padding()
			
			//tip picker
			Text("How much do you want to tip?")
			Picker("Tip Percentage", selection: $tipPercent){
				ForEach(tipOptions, id: \.self){ tipPercent in
					Text("\(tipPercent)%")
				}//forEach
			}//tip picker
			.pickerStyle(WheelPickerStyle())
			Spacer().frame(height: 20)
			
			//add yes/no button. no = tip + total. yes = input + per person total
			Text("Are you splitting the bill?")
			Picker("Splitting the bill?", selection: $isSplitting){
				Text("No").tag(false)
				Text("Yes").tag(true)
			}//split bill picker
			.pickerStyle(SegmentedPickerStyle())
			.frame(width: 150)
			.padding()
			
			//split bill
			if isSplitting {
				Text("How many people are splitting?")
				TextField("Number of people", text: $splitCount)
					.frame(width: 100)
					.keyboardType(.decimalPad)
					.textFieldStyle(RoundedBorderTextFieldStyle())
					.frame(width: 75)
					.padding()
			}//if is splitting
			
			if isSplitting == false {
				Text("Your total is: $\(totalAmount, specifier: "%.2f")")
			} else {
				Text("Each person pays: $\(totalAmount, specifier: "%.2f")")
					.font(.body)
			}
			Spacer()
			
		}//vstack
		.contentShape(Rectangle())//whole screen area is tappable
			.onTapGesture {
				hideKeyboard()
			}
	}// body
} //struct

//extension to hide keyboard
extension View {
	func hideKeyboard() {
		UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
	}
}

#Preview{
	TipCalcView()
}
