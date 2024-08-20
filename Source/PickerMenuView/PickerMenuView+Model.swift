//
//  PickerMenuView+Model.swift
//  Instagram
//
//  Created by Alexey Papin on 20.08.2024.
//

import SwiftUI

extension PickerMenuView {
	public struct Model: Equatable {
		public static func == (lhs: PickerMenuView.Model, rhs: PickerMenuView.Model) -> Bool {
			lhs.isPresented.wrappedValue == rhs.isPresented.wrappedValue &&
			lhs.selectedAddress.wrappedValue == rhs.selectedAddress.wrappedValue &&
			lhs.colorScheme == rhs.colorScheme
		}
		
		public var isPresented: Binding<Bool>
		public var selectedAddress: Binding<Address>
		public var colorScheme: ColorScheme
		public var saveAction: (() -> Void)?
		public var reloadAction: (() -> Void)?
	}
}
