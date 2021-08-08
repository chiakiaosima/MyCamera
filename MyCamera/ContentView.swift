//
//  ContentView.swift
//  MyCamera
//
//  Created by 青島智明 on 2021/08/06.
//

import SwiftUI

struct ContentView: View {
    // 撮影する写真を保持する状態変数
    @State var captureImage: UIImage? = nil
    //　撮影画面のsheet
    @State var isShowSheet = false
    // シェア画面のsheet
    @State var isShowActivity = false
    
    var body: some View {
        // 縦方向にレイアウト
        VStack {
            // スペースを追加
            Spacer()
            // 撮影した写真がある時
            if let unwrapCaptureImage = captureImage {
                // 撮影写真を表示
                Image(uiImage: unwrapCaptureImage)
                    // リサイズ
                    .resizable()
                    // アスペクト比（縦横比）を維持して画面内に
                    .aspectRatio(contentMode: .fit)
            }
            
            // スペースを追加
            Spacer()
            // 「カメラを起動する」ボタン
            Button(action: {
                // ボタンをタップした時のアクション
                // カメラが利用可能かチェック
                if UIImagePickerController.isSourceTypeAvailable(.camera)
                {
                    print("カメラは利用できます")
                    // カメラが使えるなら、isShowSheetをtrue
                    isShowSheet = true
                    
                } else {
                    print("カメラは利用できません")
                }
            }) {
                // テキスト表示
                Text("カメラを起動する")
                    //横幅いっぱい
                    .frame(maxWidth: .infinity)
                    // 高さ50ポイントを指定
                    .frame(height: 50)
                    // 文字列をセンタリング指定
                    .multilineTextAlignment(.center)
                    // 背景を青色に指定
                    .background(Color.blue)
                    // 文字色を白色に指定
                    .foregroundColor(Color.white)
            } //　「カメラを起動する」ボタンここまで
            // 上下左右に余白を追加
            .padding()
            // sheetを表示
            // isPresentedで指定した状態変数がtrueの時実行
            .sheet(isPresented: $isShowSheet) {
                // UIImagePickerController（写真撮影）をsheetを表示
                ImagePickerView(
                    isShowSheet: $isShowSheet,
                    captureImage: $captureImage)
            } // 「カメラを起動する」ボタンのsheetここまで
            // 「SNSに投稿する」ボタン
            Button(action: {
                // ボタンをタップした時のアクション
                // 撮影した写真がある時だけ
                // UIActivityViewController（シェア画面）を表示
                if let _  = captureImage {
                    isShowSheet = true
                }
            }) {
                Text("SNSに投稿する")
                    // 横幅いっぱい
                    .frame(maxWidth: .infinity)
                    // 高さ50ポイントを指定
                    .frame(height: 50)
                    // 文字列をセンタリング指定
                    .multilineTextAlignment(.center)
                    // 背景を青色に指定
                    .background(Color.blue)
                    // 文字色を白色に指定
                    .foregroundColor(Color.white)
            } // 「SNSに投稿する」ボタン　ここまで
            // 上下左右に余白を追加
            .padding()
            // sheetを表示
            // isPresentedで指定した状態変数がtrueの時実行
            .sheet(isPresented: $isShowActivity) {
                // UIActvityViewController（シェア機能）を表示
                ActivityView(shareItems: [captureImage!])
            }
        } // VStackここまで
    } // bodyここまで
} // ContentViewここまで

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
