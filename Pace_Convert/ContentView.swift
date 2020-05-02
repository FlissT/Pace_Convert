//
//  ContentView.swift
//  Pace_Convert
//
//  Created by Fliss Tournant on 30/04/2020.
//  Copyright © 2020 Fliss Tournant. All rights reserved.
//

import SwiftUI
import UIKit

//this currently works! calculates pace

struct ContentView: View {
    @State private var time = ""
    @State private var distance = 12
    
    var pace: Double {
        //this makes it so input can be in minutes, not secs
        let times = Double(time) ?? 0
        let distances = Double(distance) ?? 0// why doesn't this work?
        let paces = Double((times * 60) / distances)
        return Double(paces)
        }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    VStack {
                        Text("Pace converter")
                            .foregroundColor(.blue)
                            .padding()
            
                        TextField("time in minutes", text: $time)
                            .padding()
                        
                        TextField("time in minutes", text: $distance)
                            .padding()
                        
                        Text("\(timeToString(Int(pace))) mins/km")
                            .padding()
                            }
                        }
                    }
                }
            }
    func timeToString(_ input: Int) -> String {
        let secs = input % 60
        let mins = (input / 60) % 60
        let hours  = input / 3600
        if hours > 0 {
            return String(format: "%d:%02d:%02d", hours, mins, secs)
       } else {
            return String(format: "%d:%02d", mins, secs)
    }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
