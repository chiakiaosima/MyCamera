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
}

