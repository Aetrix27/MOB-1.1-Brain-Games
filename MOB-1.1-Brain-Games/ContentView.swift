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

func randomColor() -> String{
    let randomIndex = Int.random(in: 0..<colorsArr.count)

    return colorsArr[randomIndex]
}

var selectedColor : String = randomColor()

let bottomColor = colorOptions(text: "Red", color: .red)
var message : Bool = true
var userBool : Bool = true

func returnColor() -> String{
    switch bottomColor.color {
        case .red:
            return "Red"
        case .blue:
                return "Blue"
        case .orange:
                return "Orange"
        case .yellow:
                return "Yellow"
        case .purple:
                return "Purple"
        case .green:
                return "Green"
                
            default:
                return "Error"
    }

}

func checkEquality(){
    if returnColor() == bottomColor.text{
        message = true
    }

}

func onClick(userChoice : String) -> String{
    
    if(userChoice == "Yes"){
        userBool = true
    }else if (userChoice == "No"){
        userBool = false
    }
    
    if (userBool == message){
        return "Correct!"
    }else if(userBool != message){
        return "Incorrect!"
    }else{
        return "Error"
    }
}

struct ContentView : View {
    @State var state = checkEquality()
    @State var randomChoice = selectedColor
    //@State var bottomColor
      
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
            if userBool == true{
                Text("Correct!")
            }else if userBool == false{
                Text("Incorrect!")
            }
        }
        
        HStack{
            Button(action: {
                Text(onClick(userChoice: "Yes"))
                //randomChoice=bottomColor.text
                //bottomColor.color=randomColor()
            }, label: {
                Text("No")
            }).padding()
            Button(action: {
               Text(onClick(userChoice: "No"))
                //randomChoice=randomColor()
                //bottomColor.color=randomColor()
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

