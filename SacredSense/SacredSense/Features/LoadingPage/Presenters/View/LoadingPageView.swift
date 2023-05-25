//
//  LoadingPageView.swift
//  SacredSense
//
//  Created by Angelica Pinonkuan on 23/05/23.
//

import SwiftUI
import CoreML
import UIKit

struct LoadingPageView: View {
    
    @State private var resultObtained: Bool = false
    @State private var predictionResult: String = ""
    @Binding var imageData: Data?
    
    var body: some View {
        
        if !resultObtained {
            ZStack {
                
                BackgroundView()
                
                VStack {
                    Image("Eye3")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350, height: 490)
                        .padding(.top, 30)

                    VStack {
                        Text("We're Looking For")
                        Text("Your Sacred Sense. . .")
                    }
                    .foregroundColor(.white)
                    .font(.custom("PTSerif-Regular", size: 40))
                    .padding(.top, -40)
                }
                .padding(.top, -70)

                LoadingView()
                    .offset(x: 2, y: -90)
            }
            .onAppear {
                calculate()
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    resultObtained = true
                }
            }
        }
        
        if resultObtained {
            
            ZStack {
                
                if predictionResult == "Head Line Big Arc, Life Line Clear Thin, Heart Line index middle"{
                    ResultPage(headLine: "You have clarity of thought and mental agility. You possess a sharp intellect and have a natural ability to think logically and critically. \n \n You have excellent concentration and can focus your mind on complex tasks with ease.  \n \n You possess intellectual prowess and a keen analytical mind, enabling you to dissect situations, solve problems efficiently, and make informed decisions. \n \n You approach challenges and decision-making with rationality and logic.", lifeLine: "You have a dynamic and energetic nature. \n \n You possess a robust vitality and a zest for life. \n \n You have the strength and resilience to overcome challenges and enjoy a long and fulfilling journey. \n \n You embrace life with enthusiasm and are drawn to exciting adventures beyond the ordinary realms. \n \n You have an adventurous spirit, a thirst for new experiences, and a fearless approach to life's endeavors.", heartLine: "Your heart line reflects a blend of passion and practicality in matters of the heart. \n \n You possess a balanced approach to love, combining emotional depth with a rational mindset. \n \n You seek a harmonious connection that satisfies both your heart's desires and your need for stability. \n \n You value both intense emotional bonds and practical considerations in your relationships. \n \n You may navigate the realms of love with a blend of passion and reason, allowing your heart to guide you while maintaining a grounded perspective. \n \n Your love life is characterized by a balanced interplay of emotions and practicality, resulting in fulfilling and enduring partnerships.")
                    
                } else if predictionResult == "Head Line Big Arc, Life Line Clear Thin, Heart Line index"{
                    ResultPage(headLine: "You have clarity of thought and mental agility. You possess a sharp intellect and have a natural ability to think logically and critically. \n \n You have excellent concentration and can focus your mind on complex tasks with ease.  \n \n You possess intellectual prowess and a keen analytical mind, enabling you to dissect situations, solve problems efficiently, and make informed decisions. \n \n You approach challenges and decision-making with rationality and logic.", lifeLine: "You have a dynamic and energetic nature. \n \n You possess a robust vitality and a zest for life. \n \n You have the strength and resilience to overcome challenges and enjoy a long and fulfilling journey. \n \n You embrace life with enthusiasm and are drawn to exciting adventures beyond the ordinary realms. \n \n You have an adventurous spirit, a thirst for new experiences, and a fearless approach to life's endeavors.", heartLine: "You have a passionate and affectionate nature. \n \n Your emotions flow freely and ardently, and you possess a vibrant and expressive love style. \n \nYou wear your heart on your sleeve, unafraid to show your emotions and openly express your feelings. \n \nYou approach relationships with enthusiasm and warmth, offering love and affection generously. \n \nYou have a strong desire for deep connections and may invest a great deal of emotional energy in your romantic partnerships. \n \nYour love life is characterized by a passionate and intense nature, as your heart guides you fearlessly along the path of love.")
                    
                } else if predictionResult == "Head Line Big Arc, Life Line Small Arc, Heart Line index middle"{
                    ResultPage(headLine: "You have a creative and imaginative mind. \n \nYou possess a natural ability to think outside the box and come up with innovative ideas. \n \n You have strong intuition, allowing you to tap into deeper insights and make intuitive leaps. \n \nYou are not afraid to dream big and set ambitious goals for yourself. \n \nYou are a visionary individual who is willing to take risks and make bold decisions in order to pursue your grand aspirations.", lifeLine: "You have a dynamic and energetic nature. \n \n You possess a robust vitality and a zest for life. \n \n You have the strength and resilience to overcome challenges and enjoy a long and fulfilling journey. \n \n You embrace life with enthusiasm and are drawn to exciting adventures beyond the ordinary realms. \n \n You have an adventurous spirit, a thirst for new experiences, and a fearless approach to life's endeavors.", heartLine: "Your heart line reflects a blend of passion and practicality in matters of the heart. \n \n You possess a balanced approach to love, combining emotional depth with a rational mindset. \n \n You seek a harmonious connection that satisfies both your heart's desires and your need for stability. \n \n You value both intense emotional bonds and practical considerations in your relationships. \n \n You may navigate the realms of love with a blend of passion and reason, allowing your heart to guide you while maintaining a grounded perspective. \n \n Your love life is characterized by a balanced interplay of emotions and practicality, resulting in fulfilling and enduring partnerships.")
                    
                } else if predictionResult == "Head Line Big Arc, Life Line Small Arc, Heart Line index"{
                    ResultPage(headLine: "You have a creative and imaginative mind. \n \nYou possess a natural ability to think outside the box and come up with innovative ideas. \n \n You have strong intuition, allowing you to tap into deeper insights and make intuitive leaps. \n \nYou are not afraid to dream big and set ambitious goals for yourself. \n \nYou are a visionary individual who is willing to take risks and make bold decisions in order to pursue your grand aspirations.", lifeLine: "You have a dynamic and energetic nature. \n \n You possess a robust vitality and a zest for life. \n \n You have the strength and resilience to overcome challenges and enjoy a long and fulfilling journey. \n \n You embrace life with enthusiasm and are drawn to exciting adventures beyond the ordinary realms. \n \n You have an adventurous spirit, a thirst for new experiences, and a fearless approach to life's endeavors.", heartLine: "You have a passionate and affectionate nature. \n \n Your emotions flow freely and ardently, and you possess a vibrant and expressive love style. \n \nYou wear your heart on your sleeve, unafraid to show your emotions and openly express your feelings. \n \nYou approach relationships with enthusiasm and warmth, offering love and affection generously. \n \nYou have a strong desire for deep connections and may invest a great deal of emotional energy in your romantic partnerships. \n \nYour love life is characterized by a passionate and intense nature, as your heart guides you fearlessly along the path of love.")
                    
                } else if predictionResult == "Head Line Small Arc, Life Line Clear Thin, Heart Line index middle"{
                    ResultPage(headLine: "You have clarity of thought and mental agility. You possess a sharp intellect and have a natural ability to think logically and critically. \n \n You have excellent concentration and can focus your mind on complex tasks with ease.  \n \n You possess intellectual prowess and a keen analytical mind, enabling you to dissect situations, solve problems efficiently, and make informed decisions. \n \n You approach challenges and decision-making with rationality and logic.", lifeLine: "You have a more cautious and reserved approach to life. \n \nYou possess a thoughtful and introspective nature, carefully considering your actions and decisions. \n \nYou value prudence and takes a measured approach to various aspects of life. \n \nYou may tend to be more observant and thoughtful, preferring to analyze situations before taking action. \n \nYour reserved nature allows you to navigate life with caution and wisdom, ensuring that you make choices that align with your long-term goals and aspirations.", heartLine: "Your heart line reflects a blend of passion and practicality in matters of the heart. \n \n You possess a balanced approach to love, combining emotional depth with a rational mindset. \n \n You seek a harmonious connection that satisfies both your heart's desires and your need for stability. \n \n You value both intense emotional bonds and practical considerations in your relationships. \n \n You may navigate the realms of love with a blend of passion and reason, allowing your heart to guide you while maintaining a grounded perspective. \n \n Your love life is characterized by a balanced interplay of emotions and practicality, resulting in fulfilling and enduring partnerships.")
                    
                } else if predictionResult == "Head Line Small Arc, Life Line Clear Thin, Heart Line index"{
                    ResultPage(headLine: "You have clarity of thought and mental agility. You possess a sharp intellect and have a natural ability to think logically and critically. \n \n You have excellent concentration and can focus your mind on complex tasks with ease.  \n \n You possess intellectual prowess and a keen analytical mind, enabling you to dissect situations, solve problems efficiently, and make informed decisions. \n \n You approach challenges and decision-making with rationality and logic.", lifeLine: "You have a more cautious and reserved approach to life. \n \nYou possess a thoughtful and introspective nature, carefully considering your actions and decisions. \n \nYou value prudence and takes a measured approach to various aspects of life. \n \nYou may tend to be more observant and thoughtful, preferring to analyze situations before taking action. \n \nYour reserved nature allows you to navigate life with caution and wisdom, ensuring that you make choices that align with your long-term goals and aspirations.", heartLine: "You have a passionate and affectionate nature. \n \n Your emotions flow freely and ardently, and you possess a vibrant and expressive love style. \n \nYou wear your heart on your sleeve, unafraid to show your emotions and openly express your feelings. \n \nYou approach relationships with enthusiasm and warmth, offering love and affection generously. \n \nYou have a strong desire for deep connections and may invest a great deal of emotional energy in your romantic partnerships. \n \nYour love life is characterized by a passionate and intense nature, as your heart guides you fearlessly along the path of love.")
                    
                } else if predictionResult == "Head Line Small Arc, Life Line Small Arc, Heart Line index middle"{
                    ResultPage(headLine: "You have a creative and imaginative mind. \n \nYou possess a natural ability to think outside the box and come up with innovative ideas. \n \n You have strong intuition, allowing you to tap into deeper insights and make intuitive leaps. \n \nYou are not afraid to dream big and set ambitious goals for yourself. \n \nYou are a visionary individual who is willing to take risks and make bold decisions in order to pursue your grand aspirations.", lifeLine: "You have a more cautious and reserved approach to life. \n \nYou possess a thoughtful and introspective nature, carefully considering your actions and decisions. \n \nYou value prudence and takes a measured approach to various aspects of life. \n \nYou may tend to be more observant and thoughtful, preferring to analyze situations before taking action. \n \nYour reserved nature allows you to navigate life with caution and wisdom, ensuring that you make choices that align with your long-term goals and aspirations.", heartLine: "Your heart line reflects a blend of passion and practicality in matters of the heart. \n \n You possess a balanced approach to love, combining emotional depth with a rational mindset. \n \n You seek a harmonious connection that satisfies both your heart's desires and your need for stability. \n \n You value both intense emotional bonds and practical considerations in your relationships. \n \n You may navigate the realms of love with a blend of passion and reason, allowing your heart to guide you while maintaining a grounded perspective. \n \n Your love life is characterized by a balanced interplay of emotions and practicality, resulting in fulfilling and enduring partnerships.")
                    
                } else if predictionResult == "Head Line Small Arc, Life Line Small Arc, Heart Line index"{
                    ResultPage(headLine: "You have a creative and imaginative mind. \n \nYou possess a natural ability to think outside the box and come up with innovative ideas. \n \n You have strong intuition, allowing you to tap into deeper insights and make intuitive leaps. \n \nYou are not afraid to dream big and set ambitious goals for yourself. \n \nYou are a visionary individual who is willing to take risks and make bold decisions in order to pursue your grand aspirations.", lifeLine: "You have a more cautious and reserved approach to life. \n \nYou possess a thoughtful and introspective nature, carefully considering your actions and decisions. \n \nYou value prudence and takes a measured approach to various aspects of life. \n \nYou may tend to be more observant and thoughtful, preferring to analyze situations before taking action. \n \nYour reserved nature allows you to navigate life with caution and wisdom, ensuring that you make choices that align with your long-term goals and aspirations.", heartLine: "You have a passionate and affectionate nature. \n \n Your emotions flow freely and ardently, and you possess a vibrant and expressive love style. \n \nYou wear your heart on your sleeve, unafraid to show your emotions and openly express your feelings. \n \nYou approach relationships with enthusiasm and warmth, offering love and affection generously. \n \nYou have a strong desire for deep connections and may invest a great deal of emotional energy in your romantic partnerships. \n \nYour love life is characterized by a passionate and intense nature, as your heart guides you fearlessly along the path of love.")
                    
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    resultObtained = true
                }
            }
            
            
        }
            
    }
         
    func calculate() {
        guard let imageData = imageData else {
            return
        }
        
        // Convert Data to UIImage
        guard let image = UIImage(data: imageData) else {
            return
        }
        
        // Display the image if needed
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            // Add additional modifiers or styling as needed
        
        do {
            let config = MLModelConfiguration()
            let model = try TestPalmReading(configuration: config)
            
            // Convert UIImage to CVPixelBuffer
            guard let pixelBuffer = image.pixelBuffer() else {
                return
            }
            
            // Make prediction using Core ML model
            let prediction = try model.prediction(image: pixelBuffer)
            
            let result = prediction.classLabel
            print("Prediction result: \(result)")
            
            predictionResult = result

//            resultObtained = true
            
        } catch {
            print("Error: \(error)")
        }
    }
}
    

extension UIImage {
    func pixelBuffer() -> CVPixelBuffer? {
        let width = Int(self.size.width)
        let height = Int(self.size.height)
        let attrs = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue,
                     kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
        var pixelBuffer: CVPixelBuffer?
        let status = CVPixelBufferCreate(kCFAllocatorDefault, width, height, kCVPixelFormatType_32ARGB, attrs, &pixelBuffer)

        guard let buffer = pixelBuffer, status == kCVReturnSuccess else {
            return nil
        }

        CVPixelBufferLockBaseAddress(buffer, [])
        let pixelData = CVPixelBufferGetBaseAddress(buffer)

        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let context = CGContext(data: pixelData, width: width, height: height, bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(buffer), space: colorSpace, bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)

        context?.translateBy(x: 0, y: CGFloat(height))
        context?.scaleBy(x: 1, y: -1)

        UIGraphicsPushContext(context!)
        self.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
        UIGraphicsPopContext()
        CVPixelBufferUnlockBaseAddress(buffer, [])

        return buffer
    }
}
