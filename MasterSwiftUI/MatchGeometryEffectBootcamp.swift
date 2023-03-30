//
//  MatchGeometryEffectBootcamp.swift
//  MasterSwiftUI
//
//  Created by Pavel Andreev on 3/29/23.
//

import SwiftUI

struct MatchGeometryEffectBootcamp: View {
    
    @State private var isClicked: Bool = false
    @Namespace private var namespace
    
    var body: some View {
        VStack {
            if !isClicked {
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: 100, height: 100)
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
            }
            Spacer()
            
            if isClicked {
                RoundedRectangle(cornerRadius: 25.0)
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width: 300, height: 200)
                    
            }
               
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
        .onTapGesture {
            withAnimation(.easeInOut) {
                isClicked.toggle()
            }
        }
    }
}

struct MatchGeometryEffectBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MatchGeometryView2()
    }
}


// MARK: - Underline Animation Selected

struct MatchGeometryView2: View {
    
    let categories: [String] = ["Home", "Popular", "Saved"]
    @State private var selected: String = ""
    @Namespace private var namespace2
    
    var body: some View {
        HStack {
            ForEach(categories, id: \.self) { category in
                ZStack(alignment: .bottom) {
                    if selected == category {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.red)
                            .matchedGeometryEffect(id: "category_background", in: namespace2)
                            .frame(width: 40, height: 2)
                            .offset(y: 10)
                    }
                    
                    Text(category).foregroundColor(selected == category ? .red : .black)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .onTapGesture {
                    withAnimation(.spring()) {
                        selected = category
                    }
                }
            }
        }
    }
}
