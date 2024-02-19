//
//  ContentView.swift
//  KanyeSaid
//
//  Created by Macmaurice Osuji on 2/18/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            VStack {
                Image("dp")
                    .resizable()
                    .scaledToFit()
                    .shadow(color: .gray, radius: 5, x: 6, y: 5)
                    
            }
            Text("Kanye once said ")
                .font(.custom("Helvetica Neue", size: 24)) // Example of a professional font
                .padding()
            
            if let quoteResult = viewModel.quoteModel.quote {
                Text(quoteResult)
                    .multilineTextAlignment(.center)
                    .font(.custom("Helvetica Neue", size: 18)) // Example of a professional font
                    .padding()
                    .background(viewModel.newQuote ? Color.blue.opacity(0.2) : nil) 
                    .cornerRadius(10)
                    .shadow(radius: 5) // Add shadow
                    .padding(45)
            } else {
                ProgressView("Loading quote..")
                    .padding()
            }
            
            Button {
                withAnimation {
                    viewModel.getRequest()
                }
            } label: {
                Text("Get A Quote")
                    .font(.custom("Helvetica Neue", size: 20))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 20)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                            .shadow(radius: 5)
                    )
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
