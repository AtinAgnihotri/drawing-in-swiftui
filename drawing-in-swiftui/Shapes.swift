//
//  Shapes.swift
//  drawing-in-swiftui
//
//  Created by Atin Agnihotri on 16/06/21.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
//        path.move(to: CGPoint(x: rect.size.width / 2, y: 0))
//        path.addLine(to: CGPoint(x : rect.size.width, y: rect.size.height))
//        path.addLine(to: CGPoint(x : 0, y: rect.size.height))
//        path.addLine(to: CGPoint(x: rect.size.width / 2, y: 0))
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        return path
    }
}

struct Arc: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        var path = Path()
//        path.move(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width/2, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: clockwise)
        return path
    }
}

struct Shapes: View {
    var body: some View {
        VStack {
            Triangle()
                .stroke(Color.orange, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .frame(width: 100, height: 100, alignment: .center)
            /* Without Adjustment */ /*
            Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true).stroke(Color.blue, style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round)).frame(width: 100, height: 100, alignment: .center)
            Arc(startAngle: .degrees(0), endAngle: .degrees(250), clockwise: false).stroke(Color.blue, style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round)).frame(width: 100, height: 100, alignment: .center)
            Arc(startAngle: .degrees(0), endAngle: .degrees(250), clockwise: true).stroke(Color.blue, style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round)).frame(width: 100, height: 100, alignment: .center)
            */
            Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true).stroke(Color.blue, style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round)).frame(width: 100, height: 100, alignment: .center)
        }
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
