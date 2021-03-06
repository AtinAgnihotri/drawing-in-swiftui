//
//  AnimatingSimpleShapes.swift
//  drawing-in-swiftui
//
//  Created by Atin Agnihotri on 19/06/21.
//

import SwiftUI

struct Trapezoid: Shape {
    var insetAmount: CGFloat
    
    var animatableData: CGFloat {
        get { insetAmount }
        set { self.insetAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
//        path.addPath(<#T##path: Path##Path#>)
        return path
    }
}

struct AnimatingSimpleShapes: View {
    @State private var insetAmount: CGFloat = 50
    var body: some View {
        Trapezoid(insetAmount: insetAmount)
            .frame(width: 200, height: 200)
            .onTapGesture {
                withAnimation(.easeIn) {
                    self.insetAmount = CGFloat.random(in: 10...90)
                }
            }
    }
}

struct AnimatingSimpleShapes_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingSimpleShapes()
    }
}
