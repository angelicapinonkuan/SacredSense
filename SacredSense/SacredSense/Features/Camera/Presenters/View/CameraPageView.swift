////
////  CameraPageView.swift
////  SacredSense
////
////  Created by Angelica Pinonkuan on 24/05/23.
////
//
//import SwiftUI
//import UIKit
//import AVFoundation
//
//struct CameraPageView: View {
//    @State private var showImagePicker = true
//    @State private var image: Image?
//
//    var body: some View {
//        VStack {
//            
//
//            
////            image?
////                .resizable()
////                .scaledToFit()
////
//            
//            ImagePicker(image: $image, showImagePicker: $showImagePicker)
//                .ignoresSafeArea(.all)
//            
//        }
//
//    }
//}
//
//
//struct CameraPreview: UIViewRepresentable {
//    func makeUIView(context: Context) -> UIView {
//        let view = UIView(frame: .zero)
//        setupCamera(view: view)
//        return view
//    }
//
//    func updateUIView(_ uiView: UIView, context: Context) {}
//
//    func setupCamera(view: UIView) {
//        // Configure and start the camera capture session here
//        let captureSession = AVCaptureSession()
//            
//            guard let device = AVCaptureDevice.default(for: .video) else { return }
//            
//            do {
//                let input = try AVCaptureDeviceInput(device: device)
//                captureSession.addInput(input)
//            } catch {
//                print("Unable to access camera: \(error.localizedDescription)")
//                return
//            }
//            
//            let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
//            previewLayer.videoGravity = .resizeAspectFill
//            previewLayer.frame = view.layer.bounds
//            view.layer.addSublayer(previewLayer)
//            
//            captureSession.startRunning()
//    }
//}
//
//
//
//struct CameraPageView_Previews: PreviewProvider {
//    static var previews: some View {
//        CameraPageView()
//    }
//}
//
//
//class ImagePickerCoordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    @Binding var image: Image?
//    @Binding var showImagePicker: Bool
//    
//    init(image: Binding<Image?>, showImagePicker: Binding<Bool>) {
//        _image = image
//        _showImagePicker = showImagePicker
//    }
//    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if let uiImage = info[.originalImage] as? UIImage {
//            image = Image(uiImage: uiImage)
//        }
//        
//        showImagePicker = false
//    }
//    
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        showImagePicker = false
//    }
//}
//
//struct ImagePicker: UIViewControllerRepresentable {
//    @Binding var image: Image?
//    @Binding var showImagePicker: Bool
//    
//    func makeCoordinator() -> ImagePickerCoordinator {
//        return ImagePickerCoordinator(image: $image, showImagePicker: $showImagePicker)
//    }
//    
//    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
//        let picker = UIImagePickerController()
//        picker.delegate = context.coordinator
//        picker.sourceType = .camera
//        return picker
//    }
//    
//    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {}
//}
