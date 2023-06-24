//
//  StopwatchDIWidgetLiveActivity.swift
//  StopwatchDIWidget
//
//  Created by Harsh Soni on 24/06/23.
//


import ActivityKit
import WidgetKit
import SwiftUI

struct StopwatchDIWidgetAttributes: ActivityAttributes {
    public typealias stopwatchStatus = ContentState
    
    public struct ContentState: Codable, Hashable {
        var elapsedTime: Int
    }
}

struct StopwatchDIWidgetLiveActivity: Widget {
    
    func getTimeString(_ seconds: Int) -> String {
        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        let seconds = (seconds % 3600) % 60
        
        return hours == 0 ?
                String(format: "%02d:%02d", minutes, seconds)
                : String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: StopwatchDIWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            HStack {
                Text("Current time ellapsed")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "timer")
                    .foregroundColor(.white)
                Spacer().frame(width: 10)
                Text(getTimeString(context.state.elapsedTime))
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.yellow)
            }
            .padding(.horizontal)
            .activityBackgroundTint(Color.black.opacity(0.5))

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.center) {
                    VStack(alignment: .center) {
                        Text("StopWatchX")
                        Spacer().frame(height: 24)
                        HStack {
                            Text("Time ellapsed")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.white)
                            Spacer()
                            Image(systemName: "timer")
                            Spacer().frame(width: 10)
                            Text(getTimeString(context.state.elapsedTime))
                                .font(.system(size: 24, weight: .semibold))
                                .foregroundColor(.yellow)
                        }.padding(.horizontal)
                    }
                }
            } compactLeading: {
                Image(systemName: "timer").padding(.leading, 4)
            } compactTrailing: {
                Text(getTimeString(context.state.elapsedTime)).foregroundColor(.yellow)
                    .padding(.trailing, 4)
            } minimal: {
                Image(systemName: "timer")
                    .foregroundColor(.yellow)
                    .padding(.all, 4)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}
//
//struct StopwatchDIWidgetLiveActivity_Previews: PreviewProvider {
//    static let attributes = StopwatchDIWidgetAttributes()
//    static let contentState = StopwatchDIWidgetAttributes.ContentState(elapsedTime: 2324234)
//
//    static var previews: some View {
//        attributes
//            .previewContext(contentState, viewKind: .dynamicIsland(.compact))
//            .previewDisplayName("Island Compact")
//        attributes
//            .previewContext(contentState, viewKind: .dynamicIsland(.expanded))
//            .previewDisplayName("Island Expanded")
//        attributes
//            .previewContext(contentState, viewKind: .dynamicIsland(.minimal))
//            .previewDisplayName("Minimal")
//        attributes
//            .previewContext(contentState, viewKind: .content)
//            .previewDisplayName("Notification")
//    }
//}
