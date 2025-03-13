//
//  ContentView.swift
//  TipCalculator
//
//  Created by Hana Kastrati on 3/3/25.
//

import SwiftUI

struct ContentView: View {
	@State private var selectedTab = 0
	
	var body: some View{
		ZStack{
			//background color
			Color("AccentColor")
				.ignoresSafeArea()
			
			TabView(selection: $selectedTab){
				TipCalcView()
					.tabItem{
						Label("Tip Calculator", systemImage: "dollarsign.bank.building")
					}
					.tag(0)
				SettingsView()
					.tabItem{
						Label("Settings", systemImage: "gear")
					}
					.tag(1)
			}//tab
		}//zstack
	}//body
}//struct

#Preview {
    ContentView()
}
