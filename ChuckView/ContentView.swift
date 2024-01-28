//
//  ContentView.swift
//  ChuckView
//
//  Created by Greg Alton on 1/26/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = JokeViewModel()
    @State var currentIndex = 0

    var body: some View {
        VStack {
            Spacer()
            if let joke = viewModel.joke {
                Text(joke.value)
                    .font(.title)
                    .padding(.horizontal)
            } else {
                ProgressView("Loading Joke...")
            }
            Spacer()
            
            Button(action: {
                viewModel.fetchJoke()
            }) {
                Text("More Fun!")
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60, alignment: .center)
                    .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                    .background(Color.green)
                    .cornerRadius(10)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
