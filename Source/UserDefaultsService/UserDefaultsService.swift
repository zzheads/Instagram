//
//  UserDefaultsService.swift
//  Instagram
//
//  Created by Alexey Papin on 14.08.2024.
//

import Foundation

public final class UserDefaultsService {
	public static let shared = UserDefaultsService()
	
	private let userDefaults: UserDefaults
	private let decoder: JSONDecoder
	private let encoder: JSONEncoder
	private let encoding: String.Encoding
	
	public init(
		userDefaults: UserDefaults = .standard,
		decoder: JSONDecoder = .init(),
		encoder: JSONEncoder = .init(),
		encoding: String.Encoding = .utf8
	) {
		self.userDefaults = userDefaults
		self.decoder = decoder
		self.encoder = encoder
		self.encoding = encoding
	}
	
	private func value<T: Codable>(for key: UserDefaultsKey) throws -> T? {
		guard let string = userDefaults.string(forKey: key.rawValue) else { return nil }
		return try object(string)
	}
	
	private func setValue<T: Encodable>(_ value: T?, for key: UserDefaultsKey) throws {
		guard let value = value else {
			userDefaults.removeObject(forKey: key.rawValue)
			return
		}
		let string = try jsonString(value)
		userDefaults.set(string, forKey: key.rawValue)
	}

	private func jsonString<T: Encodable>(_ value: T) throws -> String? {
		let data = try encoder.encode(value)
		return String(data: data, encoding: encoding)
	}
	
	private func object<T: Decodable>(_ string: String) throws -> T? {
		guard let data = string.data(using: encoding) else { return nil }
		return try decoder.decode(T.self, from: data)
	}
}

extension UserDefaultsService {
	public var mode: Mode? {
		get { try? value(for: .mode) }
		set { try? setValue(newValue, for: .mode) }
	}
	
	public var address: Address? {
		get { try? value(for: .address) }
		set { try? setValue(newValue, for: .address) }
	}
}
