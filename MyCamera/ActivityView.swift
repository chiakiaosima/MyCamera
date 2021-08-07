//
//  ActivityView.swift
//  MyCamera
//
//  Created by 青島智明 on 2021/08/07.
//

import SwiftUI

struct ActivityView: UIViewControllerRepresentable {
    
    // UIActivityViewController（シェア機能）でシェアする写真
    let shareItems: [Any]
    
    // 表示するViewを生成する時に実行
    func makeUIViewController(context: Context) ->
    UIActivityViewController {
        
        // UIActivityViewControllerでシェアする機能を生成
        let controller = UIActivityViewController(
            activityItems: shareItems,
            applicationActivities: nil)
        
        // UIActivityControllerを返す
        return controller
    }
    
    // Viewが更新された時に実行
    func updateUIViewController(
        _ uiViewController: UIActivityViewController,
        context: UIViewControllerRepresentableContext<ActivityView>)
    {
        // 処理なし
    }
}


