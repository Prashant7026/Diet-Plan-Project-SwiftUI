//
//  SearchAndFilterView.swift
//  SwiftUI Diet Plan
//
//  Created by Prashant Kumar Soni on 19/12/24.
//

import SwiftUI

struct SearchAndFilterView: View {
    var body: some View {
        HStack(spacing: 24.0) {
            HStack{
                AppImageProvider.searchMagnifyingIcon
                TextField(StringConstants.sharedInstance.searchBarPlaceholder, text: .constant(""))
                    .frame(maxWidth: .infinity)
                    .frame(height: 18.0)
            }
            .padding(.vertical, 11.0)
            .padding(.horizontal, 10.0)
            .overlay {
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(Color.gray, lineWidth: 1.0)
            }
            AppImageProvider.filterIcon
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    SearchAndFilterView()
}
