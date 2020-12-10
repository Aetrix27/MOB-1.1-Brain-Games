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
var colorsTypeArr : [Color] = [.red, .orange, .blue, .purple, .yellow, .green]

let users : [(Int,String)] = [(1,"Carlos"), (2, "Dana")]


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

func onClick(userChoice : String, colorSelected : Color, topColorIn : String, userBool : inout Bool, score : inout Int) -> Bool{
    
    if(userChoice == "Yes" && checkEquality(chosenColor: colorSelected, topColor: topColorIn) == true){
        userBool = true
        score += 10
    }else if (userChoice == "No" && checkEquality(chosenColor: colorSelected, topColor: topColorIn) == false){
        userBool = true
        score += 10
    }else if (userChoice == "No" && checkEquality(chosenColor: colorSelected, topColor: topColorIn) == true){
        userBool = false
    }else if (userChoice == "Yes" && checkEquality(chosenColor: colorSelected, topColor: topColorIn) == false){
        userBool = false
    }
    return userBool
    
}

func reset(score : inout Int, gameOver : inout Bool){
    score = 0
    gameOver = true
    
}

var updatedTimer = 0

struct ContentView : View {
    //@State var state: () = checkEquality()
    @State var randomTopColor = randomColor()
    @State var updatedBottomText = randomColor()
    @State var updatedBottomColor = randomColorType()
    @State var updatedUserBool = false
    @State var buttonPressed = false
    @State var updatedScore = 0
    @State var updatedTimer = 0
    @State var gameOver = false
    @State var startGame = false
    
    //@State var bottomColor
      
    var body: some View {
        ZStack
            {
            Color.green
            VStack{
                if startGame == false{
                    Button(action: {
                        startGame = true
                        gameOver = false
                    }, label: {
                        Text("Start")
                        
                    }).padding()
                }
                
                if gameOver == false{
                    if startGame == true{
                    Text("Time Left: \(updatedTimer)")
                        .onAppear(perform:({
                            var runCount = 0
                            var timerIn = 0
                            
                            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ timer in
                                runCount += 1
                                timerIn = 30-runCount
                                updatedTimer = timerIn
                                if(updatedTimer == 0){
                                    reset(score: &updatedScore, gameOver: &gameOver)
                                    startGame = false
                                }

                                if runCount == 30{
                                    timer.invalidate()
                                }
                            }
                        }))
                        Text("The score is \(updatedScore)")
                        Text("Does the meaning match the color?")
                            .font(.largeTitle)
                            .padding()
                        Text("Meaning")
                        Text(randomTopColor)
                            .font(.headline)
                            .padding()
                            .background(Color.white)
                        Text("Text Color")
                        Text(updatedBottomText)
                            .font(.headline)
                            .padding()
                            .foregroundColor(updatedBottomColor)
                            .background(Color.white)
                        
                        if updatedUserBool == true && buttonPressed == true{
                            Text("Correct!")
                        }else if updatedUserBool == false && buttonPressed == true{
                            Text("Incorrect!")
                        }

                    }
                    
                }
            }
        }

            
            HStack{
                if startGame == true{
                    Button(action: {
                        updatedUserBool = onClick(userChoice : "No", colorSelected : updatedBottomColor, topColorIn : randomTopColor, userBool : &updatedUserBool, score: &updatedScore)
                        
                        randomTopColor = randomColor()
                        updatedBottomColor = randomColorType()
                        updatedBottomText = randomColor()
                        buttonPressed = true
                      
                        
                    }, label: {
                        Text("No")
                    }).padding()
                    Button(action: {
                        
                        updatedUserBool = onClick(userChoice : "Yes", colorSelected : updatedBottomColor, topColorIn : randomTopColor, userBool : &updatedUserBool, score: &updatedScore)
                        
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

    
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View{
        ContentView()

    }
}


