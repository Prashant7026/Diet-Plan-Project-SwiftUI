//
//  SearchAndFilterView.swift
//  SwiftUI Diet Plan
//
//  Created by Prashant Kumar Soni on 19/12/24.
//

import SwiftUI

struct SearchAndFilterView: View {
    var body: some View {
        HStack{
            TextField("Search Meals", text: .constant(""))
                .frame(maxWidth: .infinity)
                .frame(height: 40.0)
                .overlay {
                    RoundedRectangle(cornerRadius: 10.0)
                        .stroke(Color.gray, lineWidth: 1.0)
                }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    SearchAndFilterView()
}
