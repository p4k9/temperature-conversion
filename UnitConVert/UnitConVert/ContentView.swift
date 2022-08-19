//
//  ContentView.swift
//  UnitConVert
//
//  Created by Paul Kenjerski on 8/17/22.
//

import SwiftUI



struct ContentView: View {
    
    @State private var fromTemp: String = "Celsius"
    @State private var toTemp: String = "Fahrenheit"
    @State private var temperature: Double = 35.01

 
    
    let temperatureUnit  = ["Celsius", "Fahrenheit", "Kelvin"]
    
    
    func maths() -> Double {
        var results: Double
        if fromTemp == "Celsius" && toTemp == "Fahrenheit" {
            results = (temperature * 9/5) + 32
            return results
        } else if fromTemp == "Fahrenheit" && toTemp == "Celsius" {
            results = (temperature - 32) * 5/9
            return results
        } else if fromTemp == "Celsius" && toTemp == "Kelvin" {
            results = (temperature + 273.15)
            return results
        } else if fromTemp == "Kelvin" && toTemp == "Celsius" {
            results = (temperature - 273.15)
            return results
        } else if fromTemp == "Fahrenheit" && toTemp == "Kelvin" {
            results = (temperature - 32) * 5/9 + 273.15
            return results
        } else if fromTemp == "Kelvin" && toTemp == "Fahrenheit" {
            results = (temperature - 273.15) * 9/5 + 32
            return results
        } else { return temperature }
        
    }
    

    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Temperature selector", selection: $fromTemp) {
                        ForEach(temperatureUnit, id: \.self) {
                            Text($0)
                        }
                    } .pickerStyle(.segmented) } header: { Text("from:")
                    }
                
                
                Section {
                    TextField("Temperature", value: $temperature, format: .number)
                        .keyboardType(.decimalPad)
                
                } header: { Text("original Temperature:")
                }
                
                Section {
                    
                    
                        Picker("Temperature selector", selection: $toTemp) {
                            ForEach(temperatureUnit, id: \.self) {
                                Text($0)
                            }
                        } .pickerStyle(.segmented)
                        } header: { Text("to:")
                        }
                
                
                Section {
                    Text(maths(), format: .number)
                } header: {
                    Text("final temperature")
                    }
                
                
                
            } .navigationTitle("temp conversion")
                }
            }
        }







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPad Pro (9.7-inch)")
    }
}
