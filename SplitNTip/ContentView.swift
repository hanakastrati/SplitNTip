//
//  ContentView.swift
//  TipCalculator
//
//  Created by Hana Kastrati on 3/3/25.
//

import SwiftUI

struct ContentView: View {
	@State private var selectedTab = 0
	@AppStorage("colorTheme") private var colortheme: String = "DefaultTheme"
	
	var body: some View{
		
		ZStack{
			TabView(selection: $selectedTab){
				SplitNTipCalcView()
					.tabItem{
						Label("Tip Calculator", systemImage: "dollarsign.bank.building")
					}
				
					.tag(0)
					.background(Color(colortheme))

				SettingsView()
					.tabItem{
						Label("Settings", systemImage: "gear")
					}
					.tag(1) 
					.background(Color(colortheme))
			}//tab
		}//zstack
	}//body
}//struct

#Preview {
    ContentView()
}
