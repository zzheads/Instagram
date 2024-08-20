//
//  WebView.swift
//  Instagram
//
//  Created by Alexey Papin on 14.08.2024.
//

import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
	private let webView: WKWebView
	@ObservedObject var model: Model
	
	public init(_ urlString: String? = nil) {
		self.init(Model(url: urlString))
	}

	public init (_ model: Model) {
		self.model = model
		self.webView = WKWebView()
	}
			
	func makeCoordinator() -> Coordinator {
		Coordinator(self, model)
	}
	
	func makeUIView(context: Context) -> WKWebView {
		guard let urlString = model.url, let url = URL(string: urlString) else {
			return webView
		}
		
		let request = URLRequest(url: url)
		webView.navigationDelegate = context.coordinator
		webView.load(request)
		return webView
	}
	
	func updateUIView(_ uiView: WKWebView, context: Context) {
		if model.shouldGoBack {
			uiView.goBack()
			model.shouldGoBack = false
		}
	}
	
	func reload() {
		webView.reload()
	}
	
	func load(_ url: String) {
		guard let url = URL(string: url) else {
			return
		}
		webView.load(URLRequest(url: url))
	}
}
