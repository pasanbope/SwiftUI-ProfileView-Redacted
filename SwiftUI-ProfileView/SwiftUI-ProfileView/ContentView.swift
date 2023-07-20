//
//  ContentView.swift
//  SwiftUI-ProfileView
//
//  Created by Pasan Bopagamage on 2023-07-19.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isLoading = false
    
    var body: some View {
        VStack{
            VStack {
                Image("profile-pic")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                
                Text("Pasan B")
                    .font(.title)
                    .bold()
                
            }
            
            Spacer().frame(height: 30)
            
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Image(systemName: "envelope")
                        .unredacted()
                    Text("pasanb@gmail.com")
                    
                }
                HStack {
                    Image(systemName: "phone")
                        .unredacted()
                    Text("123-234-1232")
                    
                }
                HStack {
                    Image(systemName: "network")
                        .unredacted()
                    Text("dreamdesign.com")
                    
                }
            }
            
            Spacer().frame(height: 30)
            Button {
                print("Button Tapped")
            } label: {
                Text("Update Profile")
                    .bold()
                    .frame(width: 260, height: 50)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .disabled(isLoading)
        }
        .onAppear { startNetworkCall() }
        .redacted(reason: isLoading ? .placeholder: [])
    }
    
    func startNetworkCall() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isLoading = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
