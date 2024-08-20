//
//  WebView+Model.swift
//  Instagram
//
//  Created by Alexey Papin on 14.08.2024.
//

import SwiftUI

extension WebView {
	class Model: ObservableObject {
		@Published var isLoading: Bool = false
		@Published var canGoBack: Bool = false
		@Published var shouldGoBack: Bool = false
		@Published var title: String = ""
		
		var url: String?
		
		init(url: String?) {
			self.url = url
		}
	}
}
