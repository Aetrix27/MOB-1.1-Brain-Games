//
//  ViewController.swift
//  MOB-1.1-Brain-Games
//
//  Created by David Guerrero on 11/24/20.
//

import SwiftUI

struct colorOptions{
    var text: String
    var color: Color
}

var colorsArr : [String] = ["Red", "Orange", "Blue", "Purple", "Pink", "Yellow", "Green"]

var selectedColor : String = "Red"

let bottomColor = colorOptions(text: "Red", color: .red)
var message : Bool = true
var userBool : Bool = true

var randomChoice = ""

func returnColor() -> String{
    switch bottomColor.color {
        case .red:
            return "Red"

        default:
                return "Error"
    }

}


struct ContentView : View {
    
    var body: some View {
        VStack{
            Text("Does the meaning match the color?")
                .font(.largeTitle)
                .padding()
            Text(randomChoice)
          
            Text(bottomColor.text)
                .font(.headline)
                .padding()
                .foregroundColor(bottomColor.color)

        }
        
        HStack{
            Button(action: {}, label: {
                Text("No")
            }).padding()
            Button(action: {
            }, label: {
                Text("Yes")
            })
            
        }
        
    }
    
}


struct ContentView_Previews: PreviewProvider {

    static var previews: some View{
        ContentView()

    }
}

