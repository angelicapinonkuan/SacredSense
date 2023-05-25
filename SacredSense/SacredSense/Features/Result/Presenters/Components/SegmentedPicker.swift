//
//  SegmentedPicker.swift
//  SacredSense
//
//  Created by Angelica Pinonkuan on 22/05/23.
//

import SwiftUI

struct SegmentedPicker: View {
    
    
    @State private var choice = 0
    var headLine: String
    var lifeLine: String
    var heartLine: String
    
    
    var body: some View {
        
        VStack {
            Picker("Your Sacred Sense", selection: $choice) {
                Text("Heart Line").tag(0)
                Text("Head Line").tag(1)
                Text("Life Line").tag(2)
                
            }
            .font(.custom("PTSerif-Regular", size: 10))
            .pickerStyle(.segmented)
            .colorScheme(.dark)
            .onAppear {
                UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(AppColor.pink)
                }

            
            switch (choice){
            case 0:
                Title(imageName: "Heart", title: "Heart Line")
                ResultText(text: "\(heartLine)")
                
            case 1:
                Title(imageName: "Head", title: "Head Line")
                ResultText(text: "\(headLine)")
                
            case 2:
                Title(imageName: "Tree", title: "Life Line")
                ResultText(text: "\(lifeLine)")
                
            default:
                Text("not found")
            }
            
        }
        .padding(.horizontal, 40)
        
    }
}

//struct SegmentedPicker_Previews: PreviewProvider {
//    static var previews: some View {
//        SegmentedPicker()
//    }
//}
