//
//  CustomShapeBootcamp.swift
//  MasterSwiftUI
//
//  Created by Pavel Andreev on 3/30/23.
//

import SwiftUI


struct Triangle: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}

struct Diamond: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            
        }
    }
}

struct CustomShapeBootcamp: View {
    var body: some View {
        ZStack {
            
            Triangle()
                .stroke(style: StrokeStyle(lineWidth: 5 , dash: [10]))
                .foregroundColor(.blue)
//                .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                .frame(width: 300, height: 300)
               // .border(.blue, width: 1)
               
        }
    }
}

struct CustomShapeBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CustomShapeBootcamp()
    }
}
