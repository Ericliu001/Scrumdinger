//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Eric Liu on 6/12/24.
//

import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum]
    var body: some View {
        List(scrums) { scrum in
            CardView(scrum: scrum)
                .listRowBackground(scrum.theme.mainColor)
        }

    }
}

#Preview {
    ScrumsView(scrums: DailyScrum.sampleData)
        
}
