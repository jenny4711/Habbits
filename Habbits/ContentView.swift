//
//  ContentView.swift
//  Habbits
//
//  Created by Ji y LEE on 5/12/25.
//



import SwiftUI
import UserNotifications
//page
//list View

//createView
//detailView
//colorPickerView

//component
//navbarView

struct ContentView: View {
    @State private var timer: Timer? = nil
    @EnvironmentObject var habbitListViewModel : HabbitListViewModel
    @State private var habit = Habbit(
        
        id: UUID(),
        name: "운동",
            countOfDay: 0,
            lastUpdatedDate: nil,
        startDate:.now,
            didIt: [],
            emoji: "💪",
            color: "#FF5733",
            showCount: true,
            showStreak: true
        )

    var body: some View {
    
        VStack {
            
            HabbitListView()
            


            

        
        }
        .sheet(isPresented: $habbitListViewModel.showForm, content: {
            HabbitFormView( habbitFormViewModel: HabitFormViewModel())
                .background(.black)
        })
//        .padding()
        
        .onAppear{
            for i in habbitListViewModel.habbits.indices {
                  habbitListViewModel.habbits[i].updateCountIfNeeded()
              }
            
      //test
            // 타이머 시작 (1분마다 실행)
//                        timer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { _ in
//                            for i in habbitListViewModel.habbits.indices {
//                                habbitListViewModel.habbits[i].countOfDay += 1
//                                habbitListViewModel.habbits[i].lastUpdatedDate = Date()
//                            }
//                        }
            
            //----------------------
            
            
            
            
            
        }
    }
        
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(HabbitListViewModel())
            .preferredColorScheme(.dark)
    }
}
