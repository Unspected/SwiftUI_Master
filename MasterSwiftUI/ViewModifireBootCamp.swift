//
//  ViewModifireBootCamp.swift
//  MasterSwiftUI
//
//  Created by Pavel Andreev on 3/22/23.
//

import SwiftUI

struct DefaultButtonViewModifire: ViewModifier {
    
    let backgroundColor: Color
    // how to look view with property settings
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(backgroundColor)
            .foregroundColor(.white)
            .cornerRadius(10)
            .shadow(radius: 10)
    }
    
}

// MARK: - extenstion with call into View include modifier
extension View {
    
    func withDefaultButtonFormatting(backgroundColor: Color = .blue) -> some View {
        self.modifier(DefaultButtonViewModifire(backgroundColor: backgroundColor))
    }
}

struct ViewModifireBootCamp: View {
    var body: some View {
        VStack(spacing: 10) {
            
            Text("Hello World!")
                .withDefaultButtonFormatting()
                .font(.headline)
                
            Text("Hello EveryOne")
                .withDefaultButtonFormatting()
                .font(.subheadline)
               
            Text("Hello Roomie!")
                .withDefaultButtonFormatting(backgroundColor: .green)
                .font(.title)
        }.padding()
        
    }
}

struct ViewModifireBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifireBootCamp()
    }
}
