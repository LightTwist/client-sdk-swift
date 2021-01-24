//
//  File.swift
//  
//
//  Created by Russell D'Sa on 12/15/20.
//

import Foundation
import WebRTC

enum TrackError: Error {
    case invalidTrackType(String)
    case duplicateTrack(String)
}

public class Track {
    public enum Priority {
        case standard, high, low
    }
    public typealias Sid = String
    public internal(set) var sid: Track.Sid
    
    init(sid: Track.Sid) {
        self.sid = sid
    }
}
