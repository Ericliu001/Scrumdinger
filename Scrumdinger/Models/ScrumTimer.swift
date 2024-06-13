//
//  ScrumTimer.swift
//  Scrumdinger
//
//  Created by Eric Liu on 6/13/24.
//

import Foundation

@Observable
final class ScrumTimer {
    var activeSpeaker = ""
    var secondsElapsed = 0
    var secondsRemaining = 0
}
