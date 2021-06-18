//
//  ContentView.swift
//  drawing-in-swiftui
//
//  Created by Atin Agnihotri on 15/06/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(
                destination: TransformingShapes(),
                label: {
                    Text("Navigate")
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
