//
//  SafariView.swift
//  Filmx
//
//  Created by Oleksandr Kurinnyi on 09/04/2022.
//

import SafariServices
import SwiftUI

/// For more information, see [Load Safari Inside App](https://designcode.io/swiftui-handbook-safari-inside-app)
struct SafariView: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
        return
    }
}
