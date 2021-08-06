//
//  ImagePickerView.swift
//  MyCamera
//
//  Created by 青島智明 on 2021/08/06.
//

import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    
    // UIImagePickerController（写真撮影）が表示されているか
    @Binding var isShowSheet: Bool
    // 撮影した写真
    @Binding var captuerImage: UIImage?
    
    //coordinatorでコントローラのdelegateを管理
    class Coordinator: NSObject,
                       UINavigationControllerDelegate,
                       UIImagePickerControllerDelegate {
        // ImagePickerView型の変数を用意
        let parent: ImagePickerView
        // イニシャライザ
        init(_ parent: ImagePickerView) {
            self.parent = parent
        }
        //　撮影が終わった時に呼ばれるdelegateメソッド、必ず必要
        func imagePickerController(
            _ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info:
            [UIImagePickerController.InfoKey : Any]) {
            
            //撮影した写真をcaptureImageに保存
            if let originalImage =
                info[UIImagePickerController.InfoKey.originalImage]
                as? UIImage {
                parent.captuerImage = originalImage
            }
            // sheetを閉じる
            parent.isShowSheet = false
        }
        // キャンセルボタンを選択された時に呼ばれる
        //delegateメソッド、必ず必要
        func imagePickerControllerDidCancel(
            _ picker: UIImagePickerController) {
            // sheetを閉じる
            parent.isShowSheet = false
        }
    } //coordinator　ここまで
    
    // coordinatorを生成、SwiftUIによって自動的に呼び出し
    func makeCoordinator() -> Coordinator {
        // coordinatorクラスのインスタンスの生成
        return Coordinator(self)
    }
    //　Viewを生成するときに実行
    func makeUIViewController(
        context: UIViewControllerRepresentableContext<ImagePickerView>) ->
    UIImagePickerController {
        // UIImagecontrollerのインスタンス生成
        let myImagePickerController = UIImagePickerController()
        // sourceTypeにcameraを設定
        myImagePickerController.sourceType = .camera
        // delegate設定
        myImagePickerController.delegate = context.coordinator
        // UIImagePickerControllerを返す
        return myImagePickerController
    }
    // Viewが更新された時に実行
    func updateUIViewController(
        _ uiViewController: UIImagePickerController,
        context: UIViewControllerRepresentableContext<ImagePickerView>)
    {
        // 処理なし
    }
} // ImagepickerViewここまで

