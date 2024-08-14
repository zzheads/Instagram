//
//  Mode.swift
//  Instagram
//
//  Created by Alexey Papin on 14.08.2024.
//

public enum Mode: String, Codable, CaseIterable {
	case `default`
	case first
	case second
	case third
	case fourth
	case fifth
	case sixth
	case seventh
	case eighth
	case ninth
	case tenth
	
	var name: String { rawValue }
}
