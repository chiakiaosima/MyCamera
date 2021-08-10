//
//  PHPickerView.swift
//  MyCamera
//
//  Created by 青島智明 on 2021/08/09.
//

import SwiftUI
import PhotosUI

struct PHPickerView: UIViewControllerRepresentable {
    
    // sheetは表示されているか
    @Binding var isShowSheet: Bool
    // フォトライブラリーから読み込む写真
    @Binding var captureImage: UIImage?
    
    // coordinatorでコントローラのderegateを管理
    class Coordinator: NSObject,
                       PHPickerViewControllerDelegate {
        // PHPickeyViewの変数を用意
        var parent: PHPickerView
        // イニシャライザ
        init(parent: PHPickerView) {
            self.parent = parent
        }
        // フォトライブラリーで写真を選択・キャンセルしたときに実行される
        // delegate　メソッド、必ず必要
        func picker(
            _ picker: PHPickerViewController,
            didFinishPicking results: [PHPickerResult]) {
            
            // 写真を１つだけ選べる設定なので、最初の1件を設定
            if let result = results.first {
                // UIImage型の写真のみ非同期で取得
                result.itemProvider.loadObject(ofClass: UIImage.self) {
                    (image, error) in
                    //写真が取得できたら
                    if let unwrapImage = image as? UIImage {
                        // 選択された写真を追加する
                        self.parent.captureImage = unwrapImage
                    } else {
                        print("使用できる写真がないです")
                    }
                }
            } else {
                print("選択された写真はないです")
            }
            // sheetを閉じる
            parent.isShowSheet = false
        } // pickerここまで
    } //Coordinatorここまで
    
    // Coordinatorを生成、SwiftUIによって自動的に呼び出し
    func makeCoordinator() -> Coordinator {
        // Coordinatorクラスのインスタンスを生成
        Coordinator(parent: self)
    }
    
    // Viewを生成する時に実行
    func makeUIViewController(
        context: UIViewControllerRepresentableContext<PHPickerView>)
    -> PHPickerViewController {
        // PHPickerViewControllerのカスタマイズ
        var configuration = PHPickerConfiguration()
        // 静止画を選択
        configuration.filter = .images
        // フォトライブラリーで選択できる枚数を1枚にする
        configuration.selectionLimit = 1
        // PHPickeyViewControllerのインスタンスを生成
        let picker = PHPickerViewController(configuration: configuration)
        // delegate設定
        picker.delegate = context.coordinator
        // PHPickeyViewControllerを返す
        return picker
    }
    
    // Viewが更新された時に実行
    func updateUIViewController(
        _ uiViewController: PHPickerViewController,
        context: UIViewControllerRepresentableContext<PHPickerView>)
    {
        // 処理なし
    }
} // PHPickerViewここまで

