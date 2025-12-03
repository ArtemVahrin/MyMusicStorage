//
//  ErrorModel.swift
//  MyMusicStorage
//
//  Created by Артём on 03.12.2025.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case serverError(String)
}
