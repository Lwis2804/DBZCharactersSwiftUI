//
//  GifWebView.swift
//  DragonBall_SwiftUI
//
//  Created by LUIS GONZALEZ on 12/09/24.
//

import SwiftUI
import WebKit

struct GifWebView: UIViewRepresentable {
    let gifName: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.scrollView.isScrollEnabled = false
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url  = Bundle.main.url(forResource: gifName, withExtension: "gif") {
            let request = URLRequest(url: url)
            DispatchQueue.main.async {
                uiView.load(request)
            }
        }
    }
 
}


