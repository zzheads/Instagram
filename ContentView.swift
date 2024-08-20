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
	
	@Environment(\.colorScheme) private var colorScheme
	
	private let userDefaultsService = UserDefaultsService.shared
	private var webView = WebView()

	@State private var isMenuPresented: Bool = false
	@State private var selectedAddress: Address = .apple
	@Namespace private var animation
	
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
		
	private var menuView: PickerMenuView {
		PickerMenuView(
			model: .init(
				isPresented: $isMenuPresented,
				selectedAddress: $selectedAddress,
				colorScheme: colorScheme,
				saveAction: { userDefaultsService.address = selectedAddress },
				reloadAction: { webView.load(selectedAddress.address) }
			)
		)
	}
			
	var body: some View {
		mainView
			.blur(radius: isMenuPresented ? 10 : 0)
			.overlay { isMenuPresented ? menuView : nil }
			.matchedGeometryEffect(id: isMenuPresented, in: animation)
			.animation(.linear, value: menuView)
			.onAppear {
				if let address = userDefaultsService.address {
					selectedAddress = address
					webView.load(address.address)
				}
			}
	}
}

#Preview {
	ContentView()
}
