//
//  PickerMenuView+ContentView.swift
//  Instagram
//
//  Created by Alexey Papin on 20.08.2024.
//

import SwiftUI

extension PickerMenuView {
	public struct ContentView: View {		
		public enum ButtonType: String {
			case save
			case reload
			case cancel
		}
		
		private var colorScheme: ColorScheme
		private var selectedAddress: Binding<Address>
		private var onCancel: (() -> Void)
		private var onSave: (() -> Void)
		private var onReload: (() -> Void)
		
		public init(
			colorScheme: ColorScheme,
			selectedAddress: Binding<Address>,
			onCancel: @escaping () -> Void,
			onSave: @escaping () -> Void,
			onReload: @escaping () -> Void
		) {
			self.colorScheme = colorScheme
			self.selectedAddress = selectedAddress
			self.onCancel = onCancel
			self.onSave = onSave
			self.onReload = onReload
		}
		
		private var picker: some View {
			HStack {
				Text("Select address:")
					.font(.headline)
				Spacer()
				Picker(
					"Select address",
					selection: selectedAddress,
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
			VStack {
				HStack {
					button(.cancel, action: onCancel)
					Spacer()
					button(.save, action: onSave)
				}
				picker
				HStack {
					button(.reload, action: onReload)
					Spacer()
					Spacer()
				}
			}
			.frame(width: 300)
		}
		
		private func button(_ type: ButtonType, action: @escaping (() -> Void)) -> some View {
			Button(type.rawValue.capitalized, action: action)
				.frame(width: 100, height: 44)
				.foregroundColor(colorScheme == .dark ? Color.white : Color.black)
				.background(colorScheme == .dark ? Color.gray : Color.gray.opacity(0.5))
				.cornerRadius(8)
		}
	}
}
