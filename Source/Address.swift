//
//  Address.swift
//  Instagram
//
//  Created by Alexey Papin on 14.08.2024.
//

public enum Address: String, CaseIterable, Codable {
	case google
	case instagram
	case apple
	
	var name: String {
		rawValue
	}
	
	var address: String {
		"https://www.\(rawValue).com"
	}
}
