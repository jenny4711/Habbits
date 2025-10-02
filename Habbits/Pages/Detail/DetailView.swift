//
//  DetailView.swift
//  Habbits
//
//  Created by Ji y LEE on 5/12/25.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var habbitListViewModel: HabbitListViewModel
    let habbit : Habbit
    @State var editableHabbit: Habbit
    var body: some View {
        VStack{
            NavbarView(
                habitFormViewModel: HabitFormViewModel(),
                rightSideBtnType: "detail",
                onBack:{
                    dismiss()
                    habbitListViewModel.navBarType = "default"
                }, rightBtnF: nil)
            Spacer()
                .frame(height:32)
            
            Circle()
                .fill(Color.signBox)
                .frame(width:60,height:60)
            
                .overlay(
                    Text("\(editableHabbit.emoji)")
                ).padding(.bottom,8)
            
            Text("\(editableHabbit.name)")
                .padding(.bottom,4)
                .font(.system(size: 14,weight: .black))
                .foregroundColor(.textWhite)
            HabbitSubTitleView(habbit:habbit)

            
            HabbitListCellBottom(habbit: habbit)
                .padding(.top,24)
            
            Spacer()
        }
        .onAppear(perform: {
            habbitListViewModel.navBarType = "detail"
            habbitListViewModel.loading = false
        })
        .onChange(of: habbitListViewModel.habbits) { _, _ in
            if let updated = habbitListViewModel.habbits.first(where: { $0.id == habbit.id }) {
                editableHabbit = updated
               
            }
        }
        .onChange(of: habbitListViewModel.shouldDismissToList) {
            if habbitListViewModel.shouldDismissToList {
                dismiss() // ✅ DetailView 닫기
                habbitListViewModel.shouldDismissToList = false // 리셋
           
            }
        }

        .background(.black)
        .sheet(isPresented: $habbitListViewModel.showEdit, content:{ Setting(habbitFormViewModel: HabitFormViewModel(), habbit:$editableHabbit)
            
        }
        )
    }
    
    
    
    struct HabbitSubTitleView:View{
        @EnvironmentObject var habbitListViewModel: HabbitListViewModel
        var habbit:Habbit
        
        var body:some View{
            let countText = habbit.showCount ? "\(habbit.didIt.count)/\(habbit.countOfDay)" : ""
            let streakText = habbit.showStreak ? "\(habbitListViewModel.calculateStreak(habbit)) day streak" : ""
            let dot = (habbit.showCount && habbit.showStreak) ? " · " : ""
            HStack(){
                Text("\(countText)\(dot)\(streakText)")
                    .font(.system(size: 10))
                    .foregroundColor(.subText)
                
            }
        }
    }
    
    
    
    
    struct HabbitListCellBottom:View{
        var habbit :Habbit
        
//        let countOfDay:Int = 26
        
        let columns = Array(repeating: GridItem(.flexible(), spacing: 3), count: 14)
        
            var countOfDay: Int {
                    habbit.countOfDay
                }
        
        var body:some View{
            
            LazyVGrid(columns: columns, spacing: 9) {
                ForEach((0..<countOfDay).reversed(), id: \.self){ num in
                    Circle()
                        .fill(habbit.didIt.contains(num+1) ? Color(hexString:habbit.color) : Color.signBox)
                        .frame(width: 14, height: 14)
                    
                    
                }
                
            }
            .frame(width:UIScreen.main.bounds.width-81)
            .background(.black)
            .padding(.bottom,16)
            
            
        }
    }
    
    struct DetailView_Previews: PreviewProvider {
        static var previews: some View {
            DetailViewPreviewWrapper()
                .environmentObject(HabbitListViewModel())
        }
    }
    
    struct DetailViewPreviewWrapper: View {
        @State var editableHabbit = Habbit(
            id: UUID(),
            name: "운동",
            countOfDay: 0,
            lastUpdatedDate: nil,
            startDate: .now,
            didIt: [],
            emoji: "💪",
            color: "#FF5733",
            showCount: true,
            showStreak: true
        )
        
        var body: some View {
            DetailView(habbit: editableHabbit, editableHabbit: editableHabbit)
        }
    }
}
