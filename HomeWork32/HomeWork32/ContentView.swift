//
//  ContentView.swift
//  HomeWork32
//
//  Created by Dmitry on 3.04.22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var nextColor = UIColor.black
    @State private var sliderValueRed = 0.0
    @State private var sliderValueGreen = 0.0
    @State private var sliderValueBlue = 0.0
    let size: CGSize = CGSize(width: 400, height: 150)
    
    var body: some View {
        
        VStack(spacing: 30) {
            ColorView(
                color:
                    UIColor(
                        red: sliderValueRed / 255,
                        green: sliderValueGreen / 255,
                        blue: sliderValueBlue / 255,
                        alpha: 1
                    ),
                size: size
            )
            
            ColorView(
                color: nextColor,
                size: size
            )
            
            ColorSlider(
                textColor: .red,
                value: $sliderValueRed
            )

            ColorSlider(
                textColor: .green,
                value: $sliderValueGreen
            )

            ColorSlider(
                textColor: .blue,
                value: $sliderValueBlue
            )
            
            Spacer()
            
            Button("OK") {
                nextColor = UIColor(
                    red: sliderValueRed / 255,
                    green: sliderValueGreen / 255,
                    blue: sliderValueBlue / 255,
                    alpha: 1
                )
            }
            .frame(width: 300, height: 100)
            .background(Color(.red))
            .cornerRadius(40)
            .foregroundColor(.white)
            .overlay(
                RoundedRectangle(
                    cornerRadius: 40,
                    style: .continuous
                )
                    .stroke(Color.orange, lineWidth: 10)
            )
        }
        
    }
}

struct ColorView: View {
    
    var color: UIColor
    let size: CGSize
    
    var body: some View {
        Color(color)
            .frame(size)
            .cornerRadius(50)
    }
}

extension View {
    func frame(_ size: CGSize) -> some View {
        modifier(FrameFromSize(size: size))
    }
}

struct FrameFromSize: ViewModifier {
    let size: CGSize
    func body(content: Content) -> some View {
        content
            .frame(width: size.width, height: size.height)
    }
}

struct ColorSlider: View {
    
    var textColor: Color
    @Binding var value: Double
    
    var body: some View {
        HStack {
            Slider(
                value: $value,
                in: 0...255
            )
                .tint(.black)
                .colorMultiply(.orange)
                .background(textColor)
                .cornerRadius(40)
            Text("\(Int(value))")
                .foregroundColor(textColor)
                .frame(width: 40)
        }.padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
