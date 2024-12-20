//
//  HeaderView.swift
//  SwiftUI Diet Plan
//
//  Created by Prashant Kumar Soni on 19/12/24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 4.0) {
                Text("Everyday Diet Plan")
                    .bold()
                Text("Track Ananya’s every meal")
                    .foregroundColor(Color(red: 113.0/255.0, green: 113.0/255.0, blue: 113.0/255.0))
            }
            Spacer()
            cartView()
        }
        .frame(maxWidth: .infinity)
    }
    
    private func cartView() -> some View{
        VStack(spacing: 2.0) {
            Button {
                print("Cart button is pressed!")
            } label: {
                ZStack {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: 44.0, height: 44.0)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8.0)
                                .stroke(Color(red: 113.0/255.0, green: 113.0/255.0, blue: 113.0/255.0), lineWidth: 1.0)
                        )
                    AppImageProvider.cartIcon
                }
            }
            Text("Grocery List")
        }
    }
}

#Preview {
    HeaderView()
}
