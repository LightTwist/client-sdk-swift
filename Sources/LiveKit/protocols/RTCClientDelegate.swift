//
//  File.swift
//  
//
//  Created by Russell D'Sa on 12/7/20.
//

import Foundation
import WebRTC

protocol RTCClientDelegate {
    func onJoin(info: Livekit_JoinResponse)
    func onAnswer(sessionDescription: RTCSessionDescription)
    func onOffer(sessionDescription: RTCSessionDescription)
    func onTrickle(candidate: RTCIceCandidate)
    func onLocalTrackPublished(trackPublished: Livekit_TrackPublishedResponse)
    func onNegotiateRequested()
    func onParticipantUpdate(updates: [Livekit_ParticipantInfo])
    func onClose(reason: String, code: UInt16)
    func onError(error: Error)
}
