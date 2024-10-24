//
//  ContentView.swift
//  CatApi
//
//  Created by Hanan Jonathan Clerence on 2024-10-23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: CatViewModel = CatViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List(viewModel.catData) {
                    cat in
                    
                    NavigationLink {
                        CatDetailsView(viewModel: viewModel, cat: cat)
                    } label: {
                        HStack {
                            AsyncImage(url: URL(string: viewModel.createImgUrl(imageId: cat.imageId))) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .cornerRadius(10)
                                } else {
                                    ProgressView()
                                        .frame(width: 80, height: 80)
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
                }
            }
            .onAppear{
                Task{
                    await viewModel.fetchCat()
                }
        }
        }
    }
    
    
}

#Preview {
    ContentView()
}
