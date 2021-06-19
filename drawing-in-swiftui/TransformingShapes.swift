//
//  TransformingShapes.swift
//  drawing-in-swiftui
//
//  Created by Atin Agnihotri on 18/06/21.
//

import SwiftUI

struct Flower: Shape {
    // How much to move this petal away from the center
    var petalOffset: Double = 20
    // How wide to make each petal
    var petalWidth: Double = 100
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        // Count from 0 up to pi * 2, moving up pi / 8 each time
        for number in stride(from: CGFloat(0), to: CGFloat.pi * 2, by: CGFloat.pi/8) {
            // rotate the petal by the current value of our loop
            let rotation = CGAffineTransform(rotationAngle: number)
            // move the petal to be at the center of our view
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width/2, y: rect.height/2))
            // create a path for this petal using our properties plus a fixed Y and height
            let originalPetal = Path(ellipseIn: CGRect(x: CGFloat(petalOffset), y: 0, width: CGFloat(petalWidth), height: rect.width/2))
            // apply our rotation/position transformation to the petal
            let rotatedPetal = originalPetal.applying(position)
            // Add it to our original path
            path.addPath(rotatedPetal)
        }
        return path
    }
}

struct TransformingShapes: View {
    @State private var petalOffset = -20.0
    @State private var petalWidth = 0.0
    
    var body: some View {
        VStack {
            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
//                .stroke(Color.red, lineWidth: 2)
                .fill(Color.red, style: FillStyle(eoFill: true))
//                .fill(ImagePaint(image: Image("moon_sample"), scale: 0.5))
                .animation(.easeInOut(duration: 2))
//                .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
//                    .background(Image("moon_sample").resizable().scaledToFit())
//                .clipped()
//                .transition(.scale)
                
//                .animation(
//                            Animation.easeOut(duration: 1)
//                                .repeatForever(autoreverses: true)
//                        )
//            GeometryReader { geo in
//                Flower(petalOffset: petalOffset, petalWidth: petalWidth)
//    //                .stroke(Color.red, lineWidth: 2)
////                    .fill(Color.red, style: FillStyle(eoFill: true))
//                    .fill(ImagePaint(image: Image("moon_sample"), scale: 0.5))
//                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
////                    .background(Image("moon_sample").resizable().scaledToFit())
//                    .clipped()
//                    .animation(
//                                Animation.easeOut(duration: 1)
//                                    .repeatForever(autoreverses: true)
//                            )
////                    .animation(.easeInOut(duration: 2))
////                    .transition(.scale)
//            }
            
//            TextField
            
            Text("Offset")
            Slider(value: $petalOffset, in: -40...40)
                .padding([.horizontal, .bottom])

            Text("Width")
            Slider(value: $petalWidth, in: 0...100)
                .padding(.horizontal)
            Button("Animate Width") {
                withAnimation(.easeInOut(duration: 2)) {
                    self.petalWidth += 25
                }
            }
            
        }.onAppear {
//            withAnimation (.easeIn){
//                self.petalWidth += 100
//            }
//            self.petalWidth += 100
        }
    }
}

struct TransformingShapes_Previews: PreviewProvider {
    static var previews: some View {
        TransformingShapes()
    }
}
