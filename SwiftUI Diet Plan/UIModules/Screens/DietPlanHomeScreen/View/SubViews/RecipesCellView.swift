//
//  RecipesCellView.swift
//  SwiftUI Diet Plan
//
//  Created by Prashant Kumar Soni on 20/12/24.
//

import SwiftUI

struct RecipesCellView: View {
    @Binding var selectAllClicked: Bool
    private let cellData: Recipe
    
    init(selectAllClicked: Binding<Bool>, cellData: Recipe) {
        self._selectAllClicked = selectAllClicked
        self.cellData = cellData
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 9.0) {
            checkButton()
            VStack(spacing: 8.0) {
                
                Text(TimeFormatter.formatTo12Hour(timeSlot: cellData.timeSlot))
                    .foregroundColor(Color.black)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(spacing: 7.0){
                    recipeImage()
                    cellRightPart()
                        .padding(.top, 8.0)
                }
                .frame(maxWidth: .infinity)
                .aspectRatio(2.38, contentMode: .fit)
                .padding(.leading, 8.0)
                .background(Color(red: 245.0/255.0, green: 242.0/255.0, blue: 255.0/255.0))
                .overlay{
                    RoundedRectangle(cornerRadius: 12.0)
                        .stroke(Color(red: 206.0/255.0, green: 194.0/255.0, blue: 255.0/255.0), lineWidth: 1.5)
                }
            }
        }
    }
    
    private func checkButton() -> some View {
        HStack(spacing: 9.0){
            if selectAllClicked{
                Image(systemName: "checkmark.square.fill")
                    .resizable()
                    .foregroundColor(Color(red: 76.0/255.0, green: 88.0/255.0, blue: 217.0/255.0))
                    .frame(width: 19.0, height: 19.0)
            }
        }
    }
    
    private func recipeImage() -> some View {
        AsyncImage(url: URL(string: cellData.image)){ result in
            result.image?
                .resizable()
                .scaledToFill()
        }
        .frame(width: 109.0, height: 114.0)
        .cornerRadius(8.0)
        .clipped()
    }
    
    private func cellRightPart() -> some View {
        VStack(alignment: .leading) {
            HStack(spacing: 8.0) {
                Text(cellData.title)
                Spacer()
                AppImageProvider.heartIcon
            }
            .padding(.trailing, 8.0)
            Spacer()
            Group {
                durationView()
                Divider()
                doubleButtonView()
            }
            .padding(.bottom, 8.0)
        }
    }
    
    private func durationView() -> some View {
        HStack(spacing: 2.0) {
            AppImageProvider.clockImage
            Text("\(cellData.duration) mins")
        }
        .padding(.vertical, 2.0)
        .padding(.horizontal, 4.0)
        .background(Color.white)
        .cornerRadius(2.0)
    }
    
    private func doubleButtonView() -> some View {
        HStack {
            customizeButtonView()
            if !selectAllClicked{
                fedButtonView()
                    .padding(.trailing, 7.0)
            }
        }
        .frame(height: 28.0)
    }
    
    private func customizeButtonView() -> some View {
        HStack {
            AppImageProvider.customizeIcon
            Text("Customize")
                .foregroundColor(Color.white)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
        }
        .padding(.vertical, 6.0)
        .padding(.horizontal, 9.5)
        .background(Color(red: 76.0/255.0, green: 88.0/255.0, blue: 217.0/255.0))
        .cornerRadius(33.0)
    }
    
    private func fedButtonView() -> some View {
        HStack(alignment: .center, spacing: 4.0) {
            Spacer()
            Image(systemName: cellData.isCompleted == 1 ? "checkmark.circle.fill" : "checkmark.circle")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 16.0)
            HStack(spacing: 0.0){
                Text("Fed")
                Text(cellData.isCompleted == 1 ? "" : "?")
            }
                .minimumScaleFactor(0.5)
                .lineLimit(1)
            Spacer()
        }
        .foregroundColor(Color(red: 76.0/255.0, green: 88.0/255.0, blue: 217.0/255.0))
        .padding(.vertical, 6.0)
        .padding(.horizontal, 9.5)
        .background(Color.clear)
        .overlay(content: {
            RoundedRectangle(cornerRadius: 33.0)
                .stroke(Color(red: 76.0/255.0, green: 88.0/255.0, blue: 217.0/255.0), lineWidth: 1.0)
        })
    }

}

//#Preview {
//    RecipesCellView(selectAllClicked: .constant(true))
//}
