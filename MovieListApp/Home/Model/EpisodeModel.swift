//
//  EpisodeModel.swift
//  MovieListApp
//
//  Created by Yennifer Jhoselin Hurtado Arce on 3/6/21.
//  Copyright © 2021 Yennifer Jhoselin Hurtado Arce. All rights reserved.
//

import Foundation

// MARK: - EpisodeModel

struct EpisodeModel : Decodable {
	let episode_id : Int?
	let title : String?
	let season : String?
	let air_date : String?
	let characters : [String]?
	let episode : String?
	let series : String?

	enum CodingKeys: String, CodingKey {

		case episode_id = "episode_id"
		case title = "title"
		case season = "season"
		case air_date = "air_date"
		case characters = "characters"
		case episode = "episode"
		case series = "series"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		episode_id = try values.decodeIfPresent(Int.self, forKey: .episode_id)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		season = try values.decodeIfPresent(String.self, forKey: .season)
		air_date = try values.decodeIfPresent(String.self, forKey: .air_date)
		characters = try values.decodeIfPresent([String].self, forKey: .characters)
		episode = try values.decodeIfPresent(String.self, forKey: .episode)
		series = try values.decodeIfPresent(String.self, forKey: .series)
	}

}
