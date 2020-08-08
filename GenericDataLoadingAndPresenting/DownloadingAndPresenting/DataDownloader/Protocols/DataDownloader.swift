//
//  DataDownloader.swift
//  GenericDataLoadingAndPresenting
//
//  Created by Artur Azarau on 08.08.2020.
//  Copyright © 2020 Artur Azarau. All rights reserved.
//

protocol DataDownloader {
    associatedtype ObjectToDownload
    
    func download(data: ([ObjectToDownload]?) -> ())
}
