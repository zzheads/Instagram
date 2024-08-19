//
//  PickerMenuView.swift
//  Instagram
//
//  Created by Alexey Papin on 19.08.2024.
//

import SwiftUI

public struct PickerMenuView<Content: View>: View {
	@Environment(\.colorScheme) private var colorScheme

	public var title: String?
	@Binding public var isPresented: Bool
	@Binding public var selectedAddress: Address
	@ViewBuilder public var content: (() -> Content)

	private var picker: some View {
		HStack {
			if let title = title {
				Text(title)
					.font(.headline)
			}
			Picker(
				title ?? "",
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
	
	public var body: some View {
		VStack(spacing: 0) {
			picker
				.padding(.all)
			content()
		}
		.foregroundColor(colorScheme == .dark ? Color.white : Color.black)
		.background(colorScheme == .dark ? Color.black : Color.white)
		.background(Color.white)
		.cornerRadius(12)
	}
}
