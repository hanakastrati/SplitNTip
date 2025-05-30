//
//  Settings.swift
//  TipCalculator
//
//  Created by Hana Kastrati on 3/7/25.
//

import SwiftUI

struct SettingsView: View {
	
	@AppStorage("colorTheme") private var colortheme: String = "DefaultTheme"
	@AppStorage("defaultTip") private var defaultTip: Int = 20
	
	var body: some View {
		VStack(){
			
			Text("Settings")
				.font(.largeTitle)
				.bold()
				.padding(.top, 20)
			Divider()
				.padding(.bottom, 10)

			VStack(){
				HStack(){
					//color scheme options
					Text("Choose your default tip percentage:")
						.font(.headline)
					Picker("Choose your default tip:", selection: $defaultTip){
						Text("5%").tag(5)
						Text("10%").tag(10)
						Text("15%").tag(15)
						Text("18%").tag(18)
						Text("20%").tag(20)
						Text("25%").tag(25)
					}//tip picker
					.pickerStyle(MenuPickerStyle())
					.background(Color("PickerTheme"))
					.cornerRadius(15)
				}//tip hstack
				
				Divider()
				
				HStack(){
					
					Text("Select Theme:")
						.padding()
						.font(.headline)
					
					Picker("Choose your favorite color theme:", selection: $colortheme){
						Text("Default").tag("DefaultTheme")
						Text("Red").tag("RedTheme")
						Text("Orange").tag("OrangeTheme")
						Text("Green").tag("GreenTheme")
						Text("Blue").tag("BlueTheme")
						Text("Purple").tag("PurpleTheme")
					}//colorpicker
					.pickerStyle(MenuPickerStyle())
					.background(Color("PickerTheme"))
					.cornerRadius(15)
				}//hstack
				Spacer()
			}//stack2
			
		}//stack 1
		.padding(.all, 1.0)

	} //body
} //struct

#Preview {
	SettingsView()
}
