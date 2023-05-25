//
//  ResultPage.swift
//  SacredSense
//
//  Created by Angelica Pinonkuan on 22/05/23.
//

import SwiftUI

struct ResultPage: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var choice = 0
    var headLine: String
    var lifeLine: String
    var heartLine: String
    
    
    var body: some View {
        
        
        ZStack{
            
            BackgroundView()
            
            VStack {
                SegmentedPicker(headLine: headLine, lifeLine: lifeLine, heartLine: heartLine)
            
                Buttons(destination: AnyView(SplashScreenView().navigationBarBackButtonHidden(true)), text: "Back to Home")
                    .padding(.bottom, 5)
                
            }
            .padding(.top, 0)
            
            
        }
        
    }
}

//struct ResultPage_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultPage()
//    }
//}
