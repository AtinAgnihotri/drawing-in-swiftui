//
//  ArrowShape.swift
//  drawing-in-swiftui
//
//  Created by Atin Agnihotri on 19/06/21.
//

import SwiftUI

struct Arrow: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.width/4, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.width/4, y: rect.maxY))
        path.addLine(to: CGPoint(x: (rect.width/4) * 3, y: rect.maxY))
        path.addLine(to: CGPoint(x: (rect.width/4) * 3, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        return path
    }
}

struct ArrowShape: View {
    @State private var lineWidth: CGFloat = 6
    var body: some View {
        Arrow()
            .stroke(Color.red, lineWidth: lineWidth)
            .padding()
            .onAppear {
                withAnimation(.easeIn(duration: 1).repeatForever(autoreverses: true)) {
                    lineWidth = 1
                }
            }
    }
}

struct ArrowShape_Previews: PreviewProvider {
    static var previews: some View {
        ArrowShape()
    }
}
