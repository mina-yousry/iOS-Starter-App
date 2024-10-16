//
//  MarvelCharacterEntity.swift
//  StarterApp
//
//  Created by Mina Yousry on 29/12/2022.
//

import Foundation

// MARK: - DataClass
class BaseDataEntity<T: Codable>: Codable {
    var offset, limit, total, count: Int?
    var results: [T]?

    enum CodingKeys: String, CodingKey {
        case offset
        case limit
        case total
        case count
        case results
    }
    
    required init(from decoder: Decoder) throws {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            offset = try values.decodeIfPresent(Int.self, forKey: .offset)
            limit = try values.decodeIfPresent(Int.self, forKey: .limit)
            total = try values.decodeIfPresent(Int.self, forKey: .total)
            count = try values.decodeIfPresent(Int.self, forKey: .count)
            results = try values.decodeIfPresent([T].self, forKey: .results)
        } catch let err {
            print("bug")
            print(err.localizedDescription)
        }
    }
    
    init(offset: Int?, limit: Int?, total: Int?, count: Int?, results: [T]?) {
        self.offset = offset
        self.limit = limit
        self.total = total
        self.count = count
        self.results = results
    }
}

class MarvelCharactersDataEntity: BaseDataEntity<MarvelCharacter> {}
class MarverCharactersResponseEntity: BaseResponseEntity<MarvelCharactersDataEntity> {}

// MARK: - MarvelCharacter
class MarvelCharacter: Codable {
    var id: Int?
    var name, description: String?
    //var modified: Date?
    var thumbnail: Thumbnail?
    var resourceURI: String?
    var comics, series: Comics?
    var stories: Stories?
    var events: Comics?
    var urls: [URLElement]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        //case modified
        case thumbnail
        case resourceURI
        case comics
        case series
        case stories
        case events
        case urls
    }
    
    required init(from decoder: Decoder) throws {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            description = try values.decodeIfPresent(String.self, forKey: .description)
            //modified = try values.decodeIfPresent(Date.self, forKey: .modified)
            thumbnail = try values.decodeIfPresent(Thumbnail.self, forKey: .thumbnail)
            resourceURI = try values.decodeIfPresent(String.self, forKey: .resourceURI)
            comics = try values.decodeIfPresent(Comics.self, forKey: .comics)
            series = try values.decodeIfPresent(Comics.self, forKey: .series)
            stories = try values.decodeIfPresent(Stories.self, forKey: .stories)
            events = try values.decodeIfPresent(Comics.self, forKey: .events)
            urls = try values.decodeIfPresent([URLElement].self, forKey: .urls)
        } catch let err {
            print("bug")
            print(err.localizedDescription)
        }
    }
    

    init(id: Int?, name: String?, description: String?, modified: Date?, thumbnail: Thumbnail?, resourceURI: String?, comics: Comics?, series: Comics?, stories: Stories?, events: Comics?, urls: [URLElement]?) {
        self.id = id
        self.name = name
        self.description = description
        //self.modified = modified
        self.thumbnail = thumbnail
        self.resourceURI = resourceURI
        self.comics = comics
        self.series = series
        self.stories = stories
        self.events = events
        self.urls = urls
    }
}

// MARK: - Comics
class Comics: Codable {
    var available: Int?
    var collectionURI: String?
    var items: [ComicsItem]?
    var returned: Int?

    init(available: Int?, collectionURI: String?, items: [ComicsItem]?, returned: Int?) {
        self.available = available
        self.collectionURI = collectionURI
        self.items = items
        self.returned = returned
    }
}

// MARK: - ComicsItem
class ComicsItem: Codable {
    var resourceURI: String?
    var name: String?

    init(resourceURI: String?, name: String?) {
        self.resourceURI = resourceURI
        self.name = name
    }
}

// MARK: - Stories
class Stories: Codable {
    var available: Int?
    var collectionURI: String?
    var items: [StoriesItem]?
    var returned: Int?

    init(available: Int?, collectionURI: String?, items: [StoriesItem]?, returned: Int?) {
        self.available = available
        self.collectionURI = collectionURI
        self.items = items
        self.returned = returned
    }
}

// MARK: - StoriesItem
class StoriesItem: Codable {
    var resourceURI: String?
    var name: String?
    var type: ItemType?

    init(resourceURI: String?, name: String?, type: ItemType?) {
        self.resourceURI = resourceURI
        self.name = name
        self.type = type
    }
}

enum ItemType: String, Codable {
    case cover = "cover"
    case empty = ""
    case interiorStory = "interiorStory"
}

// MARK: - Thumbnail
class Thumbnail: Codable {
    var path: String?
    var thumbnailExtension: String?
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
    
    required init(from decoder: Decoder) throws {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            path = try values.decodeIfPresent(String.self, forKey: .path)
            thumbnailExtension = try values.decodeIfPresent(String.self, forKey: .thumbnailExtension)
        } catch let err {
            print("bug")
            print(err.localizedDescription)
        }
    }
    
    init(path: String?, thumbnailExtension: String?) {
        self.path = path
        self.thumbnailExtension = thumbnailExtension
    }
}

// MARK: - URLElement
class URLElement: Codable {
    var type: URLType?
    var url: String?

    init(type: URLType?, url: String?) {
        self.type = type
        self.url = url
    }
}

enum URLType: String, Codable {
    case comiclink = "comiclink"
    case detail = "detail"
    case wiki = "wiki"
}
