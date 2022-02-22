//
//  CamDigiKeyClientDelegate.swift
//  CamDigiKey-Sample-Code-iOS
//
//  Created by Techo Startup Center on 22/2/22.
//

import Foundation

protocol CamDigiKeyClientDelegate {
    func didAuthorizedLoginRequest(authToken: String)
    func didFailAuthorizedLoginRequest(message: String)
}
