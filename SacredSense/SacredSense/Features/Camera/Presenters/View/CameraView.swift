//
//  CameraView.swift
//  SacredSense
//
//  Created by Angelica Pinonkuan on 24/05/23.
//

import SwiftUI
import AVFoundation

struct CameraView: View {

    @StateObject var camera = CameraModel()
    @State private var capturedImage: UIImage?

    var body: some View {
        ZStack {

            CameraPreview(camera: camera)
                .overlay {
                    Image("Overlay")
                }
                .ignoresSafeArea(.all, edges: .all)
            

            VStack {
                if camera.isTaken{
                    
                    Spacer()
                    Buttons(destination: AnyView(LoadingPageView(imageData: $camera.capturedImageData).navigationBarBackButtonHidden(true)), text: "Use Photo")
                        

                    Button {
                        camera.reTake()
                        
                    } label: {

                        ZStack {
                            RoundedRectangle (cornerRadius: 8)
                                .frame(width: 300, height: 50)
                                .foregroundColor(Color.gray)
                            Text("Retake")
                                .foregroundColor(Color.white)
                                .font(.custom("PTSerif-Regular", size: 20))
                        }
                    }.navigationBarBackButtonHidden(true)
                } else {
                    
                    ZStack {
                        Rectangle()
                            .frame(width: 280, height: 30)
                            .foregroundColor(AppColor.pink)
                        Text("Place your palm on the circle")
                            .foregroundColor(Color.white)
                            .font(.custom("PTSerif-Regular", size: 20))
                    }
                    .padding(.top, 40)
                    
                    Spacer()
                    
                    Button {
                        camera.takePic()
                    } label: {
                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 65, height: 65)

                            Circle()
                                .stroke(Color.white, lineWidth: 2)
                                .frame(width: 75, height: 75)
                        }
                    }
                    .padding(.bottom, 50)
                }
            }
        }
        .onAppear {
            camera.Check()
        }
    }
}


class CameraModel: NSObject, ObservableObject, AVCapturePhotoCaptureDelegate {
    
    override init() {
            super.init()
            self.preview = AVCaptureVideoPreviewLayer()
        }
    
    @Published var isTaken = false
    @Published var session = AVCaptureSession()
    @Published var alert = false
    
    //since we're going to read pic data...
    @Published var output = AVCapturePhotoOutput()
    
    
    //preview..
    
    @Published var preview : AVCaptureVideoPreviewLayer!
    
    //Pic Data..
    @Published var isSaved = false
//    @Published var picData = Data(count: 0)
    @Published var capturedImageData: Data?
    
    // Add a published property to hold the captured image
    @Published var capturedImage: UIImage?
    
    func Check() {
        //first checking if camera has got permission
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            SetUp()
            return
            //setting up session
        case .notDetermined:
            //retusting for permission
            AVCaptureDevice.requestAccess(for: .video){ (status) in
                
                if status{
                    self.SetUp()
                }
                
            }
            
        case .denied:
            self.alert.toggle()
            return
            
        default:
            return
            
        }
    }
    
    func SetUp(){
        //setting up camera
        
        do {
            
            //setting configs

            self.session.beginConfiguration()
            
            
            if let device = AVCaptureDevice.default(for: .video) {
                do {
                    let input = try AVCaptureDeviceInput(device: device)
                    // Rest of the setup code
                    
                    //checking and adding to session
                    if self.session.canAddInput(input){
                        self.session.addInput(input)
                    }
                    
                    //same for output
                    if self.session.canAddOutput(self.output){
                        self.session.addOutput(self.output)
                    }
                } catch {
                    print("Failed to create AVCaptureDeviceInput: \(error.localizedDescription)")
                }
            } else {
                print("No available video device")
            }
            
            self.session.commitConfiguration()
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    //take and retake functions
    
    func takePic() {
        DispatchQueue.global(qos: .background).async {
            self.output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation { self.isTaken.toggle() }
            self.session.stopRunning()
        }
    }
    
    func reTake(){
        DispatchQueue.global(qos: .background).async {
            self.session.startRunning()
            
            DispatchQueue.main.async {
                
                withAnimation{
                    self.isTaken.toggle()
                }
            }
        }
    }

    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
            if let error = error {
                print("Error capturing photo: \(error.localizedDescription)")
                return
            }

            print("Pic taken...")

            guard let imageData = photo.fileDataRepresentation() else {
                return
            }

            // Store the captured image data
            self.capturedImageData = imageData
        }
    
//    func convertPic() -> UIImage{
//        
//        let image = UIImage(data: self.picData)!
//        
//        //saving image
//        return image
//        
//    }
}


struct CameraPreview: UIViewRepresentable{
    
    @ObservedObject var camera: CameraModel
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: UIScreen.main.bounds)
        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
        camera.preview.frame = view.frame
        
        //your own properties
        camera.preview.videoGravity = .resizeAspectFill
        view.layer.addSublayer(camera.preview)
        
        //starting session
        camera.session.startRunning()
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}
