//
//  Buttons.swift
//  SacredSense
//
//  Created by Angelica Pinonkuan on 24/05/23.
//

import SwiftUI

struct Buttons: View {
    
    var destination: AnyView
    var text: String
    
    var body: some View {
        NavigationLink(destination: destination) {
            ZStack {
                RoundedRectangle (cornerRadius: 8)
                    .frame(width: 300, height: 50)
                    .foregroundColor(AppColor.pink)
                Text("\(text)")
                    .foregroundColor(Color.white)
                    .font(.custom("PTSerif-Regular", size: 20))
            }
        }
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons(destination: AnyView(SplashScreenView()), text: "Hello")
    }
}
