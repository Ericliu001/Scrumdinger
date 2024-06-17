//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Eric Liu on 6/10/24.
//

import SwiftUI
import SwiftData

struct MeetingView: View {
    @State var scrumTimer = ScrumTimer()
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @Binding var scrum: DailyScrum

    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(scrum.theme.mainColor)
            VStack {
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed,
                                  secondsRemaining: scrumTimer.secondsRemaining,
                                  theme: scrum.theme)
                Circle()
                    .strokeBorder(lineWidth: 24)
                MeetingFooterView(speakers: scrum.attendees.speakers, skipAction: scrumTimer.skipSpeaker)
            }
            .padding()
            .foregroundColor(scrum.theme.accentColor)
            .navigationBarTitleDisplayMode(.inline)
            .onAppear{
               startScrum()
            }
            .onDisappear{
               endScrum()
            }
        }
    }
    
    private func startScrum( ){
        scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
        scrumTimer.startScrum()
    }
    
    private func endScrum( ) {
        scrumTimer.stopScrum()
        let newHistory = History(attendees: scrum.attendees)
        scrum.histories.insert(newHistory, at: 0)
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    MeetingView(scrum: .constant(DailyScrum.sampleData[2]))
        .modelContainer(for: Item.self, inMemory: true)
}
