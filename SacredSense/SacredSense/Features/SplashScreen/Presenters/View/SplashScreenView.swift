//
//  SplashScreenView.swift
//  SacredSense
//
//  Created by Angelica Pinonkuan on 22/05/23.
//

import SwiftUI

struct SplashScreenView: View {
    
    var body: some View {
        NavigationStack {
            ZStack{
                BackgroundView()
 
                    VStack {
                        Text("SacredSense")
                            .fontWeight(.bold)
                            .font(.custom("PTSerif-Regular", size: 40))
                        
                        
                        Image("Hand")
                            .resizable()
                            .frame(width: 350, height: 700)
                            .padding(.top, -140)
                            .padding(.bottom, -120)
                        
                        
                        Text("Find out your Sacred Sense through 3 lines that run across your palm")
                            .font(.custom("PTSerif-Regular", size: 18))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                            .padding(.top, 60)
                        
                        Buttons(destination: AnyView(CameraView()), text: "Let's Start!")
                        
                    }
                    .foregroundColor(Color.white)
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
