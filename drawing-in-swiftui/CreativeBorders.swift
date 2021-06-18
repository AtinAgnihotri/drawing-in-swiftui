//
//  CreativeBorders.swift
//  drawing-in-swiftui
//
//  Created by Atin Agnihotri on 18/06/21.
//

import SwiftUI

struct ScaledMoonImage: View {
    var body: some View {
        Image("moon_sample")
            .resizable()
            .scaledToFit()
    }
}

struct CreativeBorders: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .frame(width: 300, height: 300)
    //            .background(Color.blue)
                .background(ScaledMoonImage())
    //            .border(Color.red, width: 30)
                .border(ImagePaint(image: Image("moon_sample"), sourceRect: CGRect(x: 0, y: 0, width: 0.5, height: 0.5), scale: 0.01), width: 20)
            Capsule()
                .strokeBorder(ImagePaint(image: Image("moon_sample"), sourceRect: CGRect(x: 0, y: 0, width: 1, height: 1), scale: 0.1), lineWidth: 30)
        }
    }
}

struct CreativeBorders_Previews: PreviewProvider {
    static var previews: some View {
        CreativeBorders()
    }
}
