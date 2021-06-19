//
//  SpecialEffects.swift
//  drawing-in-swiftui
//
//  Created by Atin Agnihotri on 19/06/21.
//

import SwiftUI

struct SpecialEffects: View {
    @State private var amount: CGFloat = 0.0
    
    var body: some View {
        VStack {
//            ZStack {
//                Circle()
////                    .fill(Color.red)
//                    .fill(Color(red: 1, green: 0, blue: 0))
//                    .frame(width: 200 * amount)
//                    .offset(x: -50, y: -80)
//                    .blendMode(.screen)
//                Circle()
////                    .fill(Color.green)
//                    .fill(Color(red: 0, green: 1, blue: 0))
//                    .frame(width: 200 * amount)
//                    .offset(x: 50, y: -80)
//                    .blendMode(.screen)
//
//                Circle()
////                    .fill(Color.blue)
//                    .fill(Color(red: 0, green: 0, blue: 1))
//                    .frame(width: 200 * amount)
//                    .blendMode(.screen)
//
////                ScaledMoonImage()
////                    .colorMultiply(.red)
//                /*
//                 “Multiply” is so named because it multiplies each source pixel color with the destination pixel color – in our case, each pixel of the image and each pixel of the rectangle on top
//                 */
//    //            Circle()
//    //                .fill(Color.red)
//    //                .blendMode(.multiply)
//    //                .frame(width: 365, height: 390, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//            }
//            .frame(width: 300, height: 300)
            
            Image("armstrong")
                .resizable()
                .scaledToFit()
                .saturation(Double(amount))
                .blur(radius: (1 - amount) * 20)
            
            Slider(value: $amount, in: 0...1.5).padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
        /*
         it inverts the colors, performs a multiply, then inverts them again, resulting in a brighter image rather than a darker image.
         */
    }
}

struct SpecialEffects_Previews: PreviewProvider {
    static var previews: some View {
        SpecialEffects()
    }
}
