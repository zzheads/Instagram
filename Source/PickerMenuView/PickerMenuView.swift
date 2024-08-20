//
//  PickerMenuView.swift
//  Instagram
//
//  Created by Alexey Papin on 19.08.2024.
//

import SwiftUI

public struct PickerMenuView: View, Equatable {
	public static func == (lhs: PickerMenuView, rhs: PickerMenuView) -> Bool {
		lhs.model == rhs.model
	}
	
	@State private var model: Model

	public init(model: Model) {
		self.model = model
	}
	
	private var contentView: some View {
		ContentView(
			colorScheme: model.colorScheme,
			selectedAddress: model.selectedAddress,
			onCancel: {
				model.isPresented.wrappedValue = false
			},
			onSave: {
				model.saveAction?()
				model.reloadAction?()
				model.isPresented.wrappedValue = false
			},
			onReload: {
				model.reloadAction?()
				model.isPresented.wrappedValue = false
			}
		)
	}
	
	public var body: some View {
		VStack(spacing: 0) {
			contentView
		}
		.padding(.all)
		.foregroundColor(model.colorScheme == .dark ? Color.white : Color.black)
		.background(model.colorScheme == .dark ? Color.black : Color.white)
		.background(Color.white)
		.cornerRadius(12)
	}
}
