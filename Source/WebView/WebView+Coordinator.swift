//
//  WebView+Coordinator.swift
//  Instagram
//
//  Created by Alexey Papin on 14.08.2024.
//

import WebKit
import SwiftUI

extension WebView {
	class Coordinator: NSObject, WKNavigationDelegate {
		private let parent: WebView
		@ObservedObject private var model: WebView.Model
		
		init(_ parent: WebView, _ model: WebView.Model) {
			self.parent = parent
			self.model = model
		}
		
		func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
			model.isLoading = true
		}
		
		func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
			model.isLoading = false
			model.title = webView.title ?? ""
			model.canGoBack = webView.canGoBack
		}
		
		func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
			model.isLoading = false
		}
	}
}
