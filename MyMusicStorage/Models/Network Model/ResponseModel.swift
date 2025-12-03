//
//  Response.swift
//  MyMusicStorage
//
//  Created by Артём on 03.12.2025.
//

import Foundation

struct JamendoResponse<T: Codable>: Codable {
    let headers: ResponseHeaders
    let results: [T]
}

struct ResponseHeaders: Codable {
    let code: Int
    let errorMessage: String?
}
