//
//  EnablingMetal.swift
//  drawing-in-swiftui
//
//  Created by Atin Agnihotri on 19/06/21.
//

import SwiftUI

struct ColorCyclingView: View {
    var amount = 0.0
    let steps: Int
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Circle()
                    .inset(by: CGFloat(value))
                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [
                        self.color(for: value, brightness: 1),
                        self.color(for: value, brightness: 0.5),
                    ]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
            }
        }
        .drawingGroup() // This offloads frawing to GPU using Metal, comment this out to go back to core performance
        
        /* Adding the off-screen render pass might slow down SwiftUI for simple drawing, so you should wait until you have an actual performance problem before trying to bring in drawingGroup(). */
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = (Double(value) / Double(self.steps)) + self.amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct EnablingMetal: View {
    @State private var colorCycle = 0.0
    @State private var steps = 100
    @State private var showCirle = false
    var body: some View {
        VStack {
            if showCirle {
                ColorCyclingView(amount: colorCycle, steps: steps)
                    .frame(width: 300, height: 300).transition(.scale)
            }
            
//            Text("Steps")
            Text("Color Cycle")
                .padding()
            Slider(value: $colorCycle)
                .padding()
            Toggle(isOn: $showCirle, label: {
                Text("Show Cirlce")
            }).padding()
//            Stepper("Steps: \(steps)", value: $steps, in:1...100).padding()
        }
    }
}

struct EnablingMetal_Previews: PreviewProvider {
    static var previews: some View {
        EnablingMetal()
    }
}
