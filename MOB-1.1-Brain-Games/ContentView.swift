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

var colorsArr : [String] = ["Red", "Orange", "Blue", "Purple", "Yellow", "Green"]
var colorsTypeArr : [Color] = [.red, .orange, .blue, .purple, .pink, .yellow, .green]

func randomColor() -> String{
    let randomIndex = Int.random(in: 0..<colorsArr.count)

    return colorsArr[randomIndex]
}

func randomColorType() -> Color{
    let randomIndex = Int.random(in: 0..<colorsTypeArr.count)

    return colorsTypeArr[randomIndex]
}

//var correctAnswer : Bool = true

func returnColor(bottomColorIn : Color) -> String{
    switch bottomColorIn{
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

func checkEquality(chosenColor : Color, topColor : String) -> Bool{
    var correctAnswer : Bool = false

    if returnColor(bottomColorIn: chosenColor) == topColor{
        correctAnswer = true
    }else if returnColor(bottomColorIn : chosenColor) != topColor{
        correctAnswer = false
    }
    
    return correctAnswer

}

func onClick(userChoice : String, colorSelected : Color, topColorIn : String, userBool : inout Bool) -> Bool{
    
    if(userChoice == "Yes" && checkEquality(chosenColor: colorSelected, topColor: topColorIn) == true){
        userBool = true
    }else if (userChoice == "No" && checkEquality(chosenColor: colorSelected, topColor: topColorIn) == false){
        userBool = true
    }else if (userChoice == "No" && checkEquality(chosenColor: colorSelected, topColor: topColorIn) == true){
        userBool = false
    }else if (userChoice == "Yes" && checkEquality(chosenColor: colorSelected, topColor: topColorIn) == false){
        userBool = false
    }
    return userBool
    
}

struct ContentView : View {
    //@State var state: () = checkEquality()
    @State var randomTopColor = randomColor()
    @State var updatedBottomText = randomColor()
    @State var updatedBottomColor = randomColorType()
    @State var updatedUserBool = false
    @State var buttonPressed = false
    
    

    //@State var bottomColor
      
    var body: some View {
        VStack{
            Text("Does the meaning match the color?")
                .font(.largeTitle)
                .padding()
            Text("Meaning")
            Text(randomTopColor)
            Text("Text Color")
            Text(updatedBottomText)
                .font(.headline)
                .padding()
                .foregroundColor(updatedBottomColor)
            
            if updatedUserBool == true && buttonPressed == true{
                Text("Correct!")
            }else if updatedUserBool == false && buttonPressed == true{
                Text("Incorrect!")
            }
            
        }
        
        HStack{
            Button(action: {
                updatedUserBool = onClick(userChoice : "No", colorSelected : updatedBottomColor, topColorIn : randomTopColor, userBool : &updatedUserBool)
                
                randomTopColor = randomColor()
                updatedBottomColor = randomColorType()
                updatedBottomText = randomColor()
                buttonPressed = true
              
                
            }, label: {
                Text("No")
            }).padding()
            Button(action: {
                
                updatedUserBool = onClick(userChoice : "Yes", colorSelected : updatedBottomColor, topColorIn : randomTopColor, userBool : &updatedUserBool)
                
                randomTopColor = randomColor()
                updatedBottomColor = randomColorType()
                updatedBottomText = randomColor()
                
                buttonPressed = true
              
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

