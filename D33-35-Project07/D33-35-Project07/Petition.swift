//
//  Petition.swift
//  D33-35-Project07 - Whitehouse Petitions
//
//  Created by Ignasi Perez-Valls on 23/05/2019.
//  Copyright © 2019 ignasiSwift. All rights reserved.
//


import Foundation


// D33-03-Define_custom_struct_Petition
struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}

