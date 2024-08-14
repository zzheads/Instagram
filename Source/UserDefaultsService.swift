//
//  UserDefaultsService.swift
//  Instagram
//
//  Created by Alexey Papin on 14.08.2024.
//

import Foundation

public final class UserDefaultsService {
	private let store: UserDefaults
	private let encoder: JSONEncoder
	private let decoder: JSONDecoder
	private let encoding: String.Encoding
	
	public init(
		store: UserDefaults = .standard,
		encoder: JSONEncoder = JSONEncoder(),
		decoder: JSONDecoder = JSONDecoder(),
		encoding: String.Encoding = .utf8
	) {
		self.store = store
		self.encoder = encoder
		self.decoder = decoder
		self.encoding = encoding
	}
}

extension UserDefaultsService {
	
}
