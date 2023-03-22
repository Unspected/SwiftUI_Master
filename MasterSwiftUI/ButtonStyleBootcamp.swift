//
//  ButtonStyleBootcamp.swift
//  MasterSwiftUI
//
//  Created by Pavel Andreev on 3/22/23.
//

import SwiftUI

struct ButtonPressableStyle: ButtonStyle {
    
    let scaleAmount: CGFloat
    
    init(scaleAmount: CGFloat = 0.9) {
        self.scaleAmount = scaleAmount
    }
    
    // configuration for pressed
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaleAmount : 1.0)
           // .brightness(configuration.isPressed ? 0.6 : 0)
           // .opacity(configuration.isPressed ? 0.7 : 1.0)
    }
}

extension View {
    
    func withPressebleButtonStyle(scale: CGFloat = 0.9) -> some View {
        buttonStyle(ButtonPressableStyle(scaleAmount: scale))
    }
}

struct ButtonStyleBootcamp: View {
    var body: some View {
        Button {
            print("something")
        } label: {
            Text("Click me")
                .withDefaultButtonFormatting()
        }
       // .buttonStyle(ButtonPressableStyle())
        .withPressebleButtonStyle(scale: 0.6)
        .padding(40)

    }
}

struct ButtonStyleBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleBootcamp()
    }
}
