//
//  SwiftUISpirograph.swift
//  drawing-in-swiftui
//
//  Created by Atin Agnihotri on 19/06/21.
//

import SwiftUI

struct Spirograph: Shape {
    let innerRadius: Int
    let outerRadius: Int
    let distance: Int
    var amount: CGFloat
    
    var animatableData: CGFloat {
        get { amount }
        set { self.amount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        let divisor = gcd(innerRadius, outerRadius)
        let innerRadius = CGFloat(innerRadius)
        let outerRadius = CGFloat(outerRadius)
        let distance = CGFloat(distance)
        let difference = innerRadius - outerRadius
        let endPoint = ceil(2 * CGFloat.pi * outerRadius / CGFloat(divisor)) * amount
        var path = Path()
        
        for theta in stride(from: CGFloat(0), through: endPoint, by: 0.01) {
            var x = difference * cos(theta) + distance * cos(difference / outerRadius * theta)
            var y = difference * sin(theta) - distance * sin(difference / outerRadius * theta)

            x += rect.width / 2
            y += rect.height / 2

            if theta == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        
        return path
    }
    
    func gcd(_ a: Int, _ b: Int) -> Int{
        var a = a
        var b = b
        
        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }
        
        return a
    }
    
}

struct SwiftUISpirograph: View {
    // 144, 42, 25
    // 144, 48, 1->150, 1
    @State private var innerRadius = 146.0
    @State private var outerRadius = 48.0
    @State private var distance = 46.0
    @State private var amount: CGFloat = 0
    @State private var hue = 0.6
    
    var body: some View {
//        Spirograph(innerRadius: 20, outerRadius: 50, distance: 10, amount: 4)
//        Text(String(gcd(10,15)))
        ScrollView {
            Spacer()
            ZStack {
                Spirograph(innerRadius: Int(innerRadius), outerRadius: Int(outerRadius), distance: Int(distance), amount: amount)
                    .stroke(Color(hue: hue, saturation: 1, brightness: 1), lineWidth: 1)
                    .frame(width: 300, height: 300)
                    .drawingGroup()
                Text("FCA")
                    .font(.title)
                    .bold()
                    .foregroundColor(.blue)
                    
            }

            Spacer()
            
            Group {
                Text("Inner radius: \(Int(innerRadius))")
                Slider(value: $innerRadius, in: 10...150, step: 1)
                    .padding([.horizontal, .bottom])

                Text("Outer radius: \(Int(outerRadius))")
                Slider(value: $outerRadius, in: 10...150, step: 1)
                    .padding([.horizontal, .bottom])

                Text("Distance: \(Int(distance))")
                Slider(value: $distance, in: 1...150, step: 1)
                    .padding([.horizontal, .bottom])

                Text("Amount: \(amount, specifier: "%.2f")")
                Slider(value: $amount)
                    .padding([.horizontal, .bottom])

                Text("Color")
                Slider(value: $hue)
                    .padding(.horizontal)
            }

        }.onAppear {
            withAnimation(.easeIn(duration: 1).repeatForever(autoreverses: false)) {
                amount += 1
            }
        }
    }
    
    
}

struct SwiftUISpirograph_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUISpirograph()
    }
}
