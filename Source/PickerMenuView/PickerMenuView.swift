//
//  PickerMenuView.swift
//  Instagram
//
//  Created by Alexey Papin on 19.08.2024.
//

import SwiftUI

public struct PickerMenuView<Content: View>: View {
	@Environment(\.colorScheme) private var colorScheme

	@Binding public var isPresented: Bool
	@Binding public var selectedAddress: Address
	@ViewBuilder public var content: (() -> Content)
	
	public var body: some View {
		VStack(spacing: 0) {
			content()
		}
		.padding(.all)
		.foregroundColor(colorScheme == .dark ? Color.white : Color.black)
		.background(colorScheme == .dark ? Color.black : Color.white)
		.background(Color.white)
		.cornerRadius(12)
	}
}
