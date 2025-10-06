//
//  TimePicker.swift
//  Habbits
//
//  Created by Ji y LEE on 9/26/25.
//

import SwiftUI

struct TimePicker: View {
    @Binding var hr: Int
    @Binding var m: Int
    @Binding var setAlerm:Bool
    @Binding var name:String
    @State private var alarms: [ScheduledAlarm] = []
    @State private var groups: [TimeGroup] = []   // ★ 추가: 그룹 상태
    @State private var isLoading = false
  


    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    let days = 20
                   
                    NotificationManager.shared.scheduleDaily(hour: hr, minute: m,title:"Action", body:name)
                    print(groups)
                    reload()
                    setAlerm = false
                } label: {
                    Text("DONE").foregroundColor(.white)
                }
            }
            .padding(.trailing, 16)
            .padding(.top, 16)

            Text(String(format: "시간: %02d:%02d", hr, m))
                .font(Font.med20)
                .padding(.top, 16)

            HStack{
                            VStack{
                                Text("Hour")
                                    .font(Font.semi20)
                                    .foregroundColor(Color.white)
                                HStack {
                                    Picker("Hr", selection: $hr) {
                                        ForEach(0..<24) { h in
                                            Text(String(format: "%02d", h)).tag(h)
                                                .font(.system(size: 30))
                                                .foregroundColor(Color.white)
            
                                        }
                                    }
                                    .pickerStyle(.wheel)
                                    .colorScheme(.light)
            
                            }
                            }
            
            
            
                            Divider().background(Color.black)
                            VStack{
                                Text("Minutes")
                                    .font(Font.semi20)
                                Picker("Min", selection: $m) {
                                    ForEach(0..<60) { mm in
                                        Text(String(format: "%02d", mm)).tag(mm)
                                            .font(.system(size: 30))
                                            .foregroundColor(Color.white)
            
                                    }
                                }
                                .pickerStyle(.wheel)
                                .colorScheme(.light)
                            }
            
            
                        }

            ScrollView {
                if groups.isEmpty && !isLoading {
                    Text("예약된 알림이 없습니다.").foregroundColor(.secondary)
                }
                ForEach(groups.filter{$0.hasRepeats}) { g in
                    HStack {
                        Text(String(format: "%02d:%02d", g.hour, g.minute))
                            .font(.system(size: 30))
                        Spacer()
                     


                        Button {
                            removeOne(from: g)  // ★ 가장 가까운 1개만 삭제
                        } label: {
                            Image(systemName: "trash")
                                .resizable()
                                .frame(width:25,height:25)
                            
                        }


                        Menu {
                            Button("이 시각의 예약 모두 삭제", role: .destructive) {
                                removeAll(in: g)
                            }
                        } label: {
                            Image(systemName: "trash")
                                .resizable()
                                .foregroundColor(.red)
                                
                                .frame(width:25,height:25)
                        }
                        .buttonStyle(.borderless)
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 6)
                }
            }
            .navigationTitle("알림 목록")
            .refreshable { reload() }
            .onAppear { reload() }
            .padding(.horizontal,24)
            .padding(.bottom,24)
        }
        .background(Color.black)
    }

    // MARK: - 그룹 모델 & 로직

    struct TimeGroup: Identifiable {
        let id: String
        let hour: Int
        let minute: Int
        var hasRepeats: Bool
        let count: Int
        let nonRepeatingIDs: [String]
        let repeatingIDs: [String]
        let title:String
    }

    private func buildGroups(from list: [ScheduledAlarm]) -> [TimeGroup] {
        // HH:mm 키로 묶기
        var buckets: [String: [ScheduledAlarm]] = [:]
        for a in list {
            guard let h = a.hour, let m = a.minute else { continue }
            let key = String(format: "%02d:%02d", h, m)
            buckets[key, default: []].append(a)
        }

        // 그룹 생성
        let keys = buckets.keys.sorted()
        return keys.compactMap { key in
            guard let sample = buckets[key]?.first,
                  let h = sample.hour, let m = sample.minute else { return nil }

            // 가까운 날짜 순으로 정렬(미반복 우선)
            let sorted = buckets[key]!.sorted {
                let la = ($0.year ?? 9999, $0.month ?? 99, $0.day ?? 99)
                let lb = ($1.year ?? 9999, $1.month ?? 99, $1.day ?? 99)
                return la < lb
            }

            let nonRepeats = sorted.filter { !$0.repeats }
            let repeats    = sorted.filter {  $0.repeats }

            return TimeGroup(
                id: key,
                hour: h,
                minute: m,
                hasRepeats: !repeats.isEmpty,
                count: nonRepeats.count,
                nonRepeatingIDs: nonRepeats.map { $0.id },
                repeatingIDs: repeats.map { $0.id },
                title:name
            )
        }
    }

    private func removeOne(from group: TimeGroup) {
   
        if let id = group.nonRepeatingIDs.first {
            NotificationManager.shared.cancel(id: id)
        } else if let id = group.repeatingIDs.first {
            NotificationManager.shared.cancel(id: id)
        }
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) { reload() }
    }

    private func removeAll(in group: TimeGroup) {
        let ids = group.nonRepeatingIDs + group.repeatingIDs
        ids.forEach { NotificationManager.shared.cancel(id: $0) }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) { reload() }
    }

    private func reload() {
        isLoading = true
        NotificationManager.shared.getPending { list in
            self.alarms = list
            self.groups = buildGroups(from: list)   // ★ 그룹 갱신
            self.isLoading = false
        }
    }
}

// 작은 칩
private struct Chip: View {
    var text: String
    init(_ text: String) { self.text = text }
    var body: some View {
        Text(text)
            .font(.caption2)
            .padding(.vertical, 3)
            .padding(.horizontal, 6)
            .background(Color(.systemGray5))
            .clipShape(Capsule())
    }
}




func addNotification(for hour:Int,min:Int?){
    let center = UNUserNotificationCenter.current()
    print(hour,min ?? 00)
    let addRequest = {
        let content = UNMutableNotificationContent()
        content.title  = "묵상 시간"
        content.subtitle = "묵상 하실 시간입니다."
        content.sound = UNNotificationSound.default
        
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = min == 60 ? 0 : min
        
      let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents,repeats:false)
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval:5,repeats:false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
        
    }
    center.getNotificationSettings {
        settings in
        if settings.authorizationStatus == .authorized{
            addRequest()
        }else{
            center.requestAuthorization(options:[.alert,.badge,.sound]){
                success,error in
                if success{
                    addRequest()
                }else if let error {
                    print(error.localizedDescription)
                }
            }
        }
    }
}




