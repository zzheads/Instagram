//
//  ContentView.swift
//  Instagram
//
//  Created by Alexey Papin on 29.07.2024.
//

import SwiftUI

struct ContentView: View {
	enum Title: String {
		case picker = "Please select mode:"
		case save = "Save"
		case reload = "Reload"
	}

	@State private var selectedAddress: Address = UserDefaultsService.shared.address ?? .apple

	private var webView: WebView = WebView((UserDefaultsService.shared.address ?? .apple).address)
	
	private var picker: some View {
		HStack {
			Text(Title.picker.rawValue)
				.font(.headline)
			Picker(
				Title.picker.rawValue,
				selection: $selectedAddress,
				content: {
					ForEach(Address.allCases, id: \.self) {
						Text($0.name)
					}
				}
			)
			.pickerStyle(.menu)
		}
	}
	
	private var saveButton: some View {
		button(.save) {
			UserDefaultsService.shared.address = selectedAddress
			webView.load(selectedAddress.address)
		}
	}
	
	private var reloadButton: some View {
		button(.reload) {
			webView.load(selectedAddress.address)
		}
	}
	
	var body: some View {
		VStack {
			picker
			HStack {
				saveButton
				reloadButton
			}
			webView
		}
	}
	
	private func button(_ title: Title, action: @escaping (() -> Void)) -> some View {
		Button(title.rawValue, action: action)
		.frame(width: 100, height: 44)
		.foregroundStyle(.black)
		.background(Color.secondary.opacity(0.5))
		.cornerRadius(8)
	}
}

#Preview {
	ContentView()
}
