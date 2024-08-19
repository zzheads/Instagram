//
//  ContentView.swift
//  Instagram
//
//  Created by Alexey Papin on 29.07.2024.
//

import SwiftUI
import UIKit

struct ContentView: View {
	enum Error: Swift.Error, LocalizedError {
		case unableToLoad(URL)
	}
	
	public enum ButtonType: String {
		case save
		case reload
	}

	@Environment(\.colorScheme) private var colorScheme
	@State private var isMenuPresented: Bool = false
	@State private var selectedAddress: Address = UserDefaultsService.shared.address ?? .apple
	private var webView = WebView((UserDefaultsService.shared.address ?? .apple).address)
	
	private var mainView: some View {
		ZStack {
			VStack {
				Button("Show menu") { isMenuPresented.toggle() }
				webView
			}
			.allowsHitTesting(!isMenuPresented)
			
			Color.black
				.opacity(isMenuPresented ? 0.5 : 0)
				.edgesIgnoringSafeArea(.all)
		}
	}
	
	private var menuView: some View {
		PickerMenuView(
			title: "Please select address:",
			isPresented: $isMenuPresented,
			selectedAddress: $selectedAddress,
			content: { buttons }
		)
	}
	
	private var buttons: some View {
		HStack(spacing: 16) {
			button(.save, action: {
				UserDefaultsService.shared.address = selectedAddress
				webView.load(selectedAddress.address)
				isMenuPresented.toggle()
			})
			button(.reload, action: {
				webView.load(selectedAddress.address)
				isMenuPresented.toggle()
			})
		}
		.padding(.init(top: 0, leading: 16, bottom: 16, trailing: 16))

	}
	
	var body: some View {
		mainView
			.blur(radius: isMenuPresented ? 10 : 0)
			.overlay { isMenuPresented ? menuView : nil }
	}
	
	private func button(_ type: ButtonType, action: @escaping (() -> Void)) -> some View {
		Button(type.rawValue.capitalized, action: action)
			.frame(width: 100, height: 44)
			.foregroundColor(colorScheme == .dark ? Color.white : Color.black)
			.background(colorScheme == .dark ? Color.gray : Color.gray.opacity(0.5))
			.cornerRadius(8)
	}
}

#Preview {
	ContentView()
}
