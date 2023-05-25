//
//  ResultText.swift
//  SacredSense
//
//  Created by Angelica Pinonkuan on 22/05/23.
//

import SwiftUI

struct ResultText: View {
    
    init(text: String = "") {
           UIScrollView.appearance().indicatorStyle = .white // Change the color to white
           self.text = text
    }
    
    var text: String
    
    var body: some View {
        ZStack {
            RoundedRectangle (cornerRadius: 8)
                .foregroundColor(AppColor.darkPurple)
                .frame(width: 300, height: 350)
                .shadow(color: Color.black, radius:4 , x:0 , y:2)
            
            ScrollView {
                VStack {
                    Text("\(text)")
                        .foregroundColor(Color.white)
                }
                
            }
            .frame(width: 250, height: 300)
        }
        .padding(.bottom, 20)
    }
}

struct ResultText_Previews: PreviewProvider {
    static var previews: some View {
        ResultText()
    }
}
