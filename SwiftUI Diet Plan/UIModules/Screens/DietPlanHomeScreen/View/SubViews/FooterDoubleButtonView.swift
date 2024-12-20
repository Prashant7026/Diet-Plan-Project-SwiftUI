//
//  FooterDoubleButtonView.swift
//  SwiftUI Diet Plan
//
//  Created by Prashant Kumar Soni on 20/12/24.
//

import SwiftUI

struct FooterDoubleButtonView: View {
    
    var body: some View {
        HStack(spacing: 16.0){
            fedButtonView()
            
            cancelButtonView()
        }
    }
    
    private func fedButtonView() -> some View{
        Text("\(StringConstants.sharedInstance.fedText)?")
            .foregroundColor(Color.white)
            .minimumScaleFactor(0.5)
            .lineLimit(1)
            .frame(maxWidth: .infinity, alignment: .center)
            .frame(height: 40.0)
            .padding(.vertical, 6.0)
            .padding(.horizontal, 9.5)
            .background(Color(red: 76.0/255.0, green: 88.0/255.0, blue: 217.0/255.0))
            .cornerRadius(33.0)
    }
    
    private func cancelButtonView() -> some View{
        Text(StringConstants.sharedInstance.cancelText)
            .minimumScaleFactor(0.5)
            .lineLimit(1)
            .frame(maxWidth: .infinity, alignment: .center)
            .frame(height: 40.0)
            .padding(.vertical, 6.0)
            .padding(.horizontal, 9.5)
            .cornerRadius(33.0)
            .overlay {
                RoundedRectangle(cornerRadius: 33.0)
                    .stroke(Color.black, lineWidth: 1.0)
            }
    }
}

#Preview {
    FooterDoubleButtonView()
}
