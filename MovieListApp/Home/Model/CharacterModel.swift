//
//  ListMovieModel.swift
//  MovieListApp
//
//  Created by Yennifer Jhoselin Hurtado Arce on 3/6/21.
//  Copyright © 2021 Yennifer Jhoselin Hurtado Arce. All rights reserved.
//

import Foundation

struct CharacterModel : Codable {
	let char_id : Int?
	let name : String?
	let birthday : String?
	let occupation : [String]?
	let img : String?
	let status : String?
	let nickname : String?
	let appearance : [Int]?
	let portrayed : String?
	let category : String?

	enum CodingKeys: String, CodingKey {

		case char_id = "char_id"
		case name = "name"
		case birthday = "birthday"
		case occupation = "occupation"
		case img = "img"
		case status = "status"
		case nickname = "nickname"
		case appearance = "appearance"
		case portrayed = "portrayed"
		case category = "category"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		char_id = try values.decodeIfPresent(Int.self, forKey: .char_id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		birthday = try values.decodeIfPresent(String.self, forKey: .birthday)
		occupation = try values.decodeIfPresent([String].self, forKey: .occupation)
		img = try values.decodeIfPresent(String.self, forKey: .img)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		nickname = try values.decodeIfPresent(String.self, forKey: .nickname)
		appearance = try values.decodeIfPresent([Int].self, forKey: .appearance)
		portrayed = try values.decodeIfPresent(String.self, forKey: .portrayed)
		category = try values.decodeIfPresent(String.self, forKey: .category)

    }

}
