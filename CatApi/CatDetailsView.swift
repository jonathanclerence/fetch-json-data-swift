//
//  CatDetailsView.swift
//  CatApi
//
//  Created by Hanan Jonathan Clerence on 2024-10-23.
//

import SwiftUI

struct CatDetailsView: View {
    @ObservedObject var viewModel: CatViewModel
    var cat: CatDTO
    var body: some View {
        
        AsyncImage(url: URL(string: viewModel.createImgUrl(imageId: cat.imageId))) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(10)
            } else {
                ProgressView()
                    .frame(width: 120, height: 120)
                    .cornerRadius(10)
            }
        }
        
        VStack(alignment: .leading){
            Text(cat.name)
            Text(cat.temperament)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}


