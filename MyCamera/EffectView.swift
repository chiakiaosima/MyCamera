//
//  EffectView.swift
//  MyCamera
//
//  Created by 青島智明 on 2021/08/13.
//

import SwiftUI

struct EffectView: View {
    
    // エフェクト編集画面(シート)の表示有無を管理する状態変数
    @Binding var isShowSheet: Bool
    // 撮影した写真
    let captureImage: UIImage
    // 表示する写真
    @State var showImage: UIImage?
    // シェア画面(UIActivityViewController)
    // 表示有無を管理する状態変数
    @State var isShowAcitivity = false
    
    var body: some View {
        // 縦方向にレイアウト
        VStack {
            // スペースを追加
            Spacer()
            
            if let unwrapShowImage = showImage {
                // 表示する写真がある場合は画面に表示
                Image(uiImage: unwrapShowImage)
                    // リサイズする
                    .resizable()
                    // アスペクト比（縦横比）を維持して画面内に
                    //　収まる様にする
                    .aspectRatio(contentMode: .fit)
            }
        } // VStackここまで
    } // bodyここまで
} // EffectViewここまで

struct EffectView_Previews: PreviewProvider {
    static var previews: some View {
        EffectView()
    }
}
