//
//  AnyTransitionBootCamp.swift
//  MasterSwiftUI
//
//  Created by Pavel Andreev on 3/23/23.
//

import SwiftUI


struct RotateViewModifier: ViewModifier {
    
    let rotation: Double
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: rotation))
            .offset(x: rotation != 0 ? UIScreen.main.bounds.width : 0,
                    y: rotation != 0 ? UIScreen.main.bounds.height : 0)
    }
}


// MARK: - custom animation
extension AnyTransition {
    
    static var rotation: AnyTransition {
        modifier(active: RotateViewModifier(rotation: 180),
                 identity: RotateViewModifier(rotation: 0))
    }
    
    static func rotating(rotation: Double) -> AnyTransition {
        modifier(active: RotateViewModifier(rotation: rotation),
                 identity: RotateViewModifier(rotation: 0))
    }
    
    // Customise hiding animation
    static var rotationOn: AnyTransition {
        asymmetric(insertion: rotation,
                   removal: .move(edge: .leading))
    }
}

struct AnyTransitionBootCamp: View {
    
    @State private var showRectangle: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            if showRectangle {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 250, height: 350)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.rotationOn)
                   // .transition(AnyTransition.rotating(rotation: 180))
//                    .transition(AnyTransition.rotation.animation(.easeInOut))
                   // .transition(.move(edge: .leading))
//                    .transition(AnyTransition.scale.animation(.easeOut))
            }
    
            Spacer()
            Text("Click on me!")
                .withDefaultButtonFormatting()
                .padding(.horizontal, 40)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 1)) {
                        // toggle is change state
                        showRectangle.toggle()
                    }
                }
                
        }
    }
}

struct AnyTransitionBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        AnyTransitionBootCamp()
    }
}
