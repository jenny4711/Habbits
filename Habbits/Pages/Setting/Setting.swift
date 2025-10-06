//
//  Setting.swift
//  Habbits
//
//  Created by Ji y LEE on 5/15/25.
//

import SwiftUI


struct Setting: View {
    @EnvironmentObject var habbitListViewModel:HabbitListViewModel
    @StateObject var habbitFormViewModel: HabitFormViewModel
    @Binding var habbit: Habbit
    @State private var setAlarm:Bool = false
    @State private var isAnimated:Bool = false
    @State private var hr:Int = 9
    @State private var m:Int = 30
    
   
    
    var body: some View {
        VStack{
            Spacer()
                .frame(height:16)
            NavbarView(habitFormViewModel: HabitFormViewModel(),
                       
                       rightSideBtnType: "setting",
                       onBack: nil,
                       rightBtnF: {
                habbitListViewModel.editHabbit(habbit)
                habbitListViewModel.showEdit = false
                          }
                       )
            
            VStack(spacing:16){
                //emoji
                EmojiCircleBtn(habbit:$habbit)
                //title
                NameViewEdit(habbit:$habbit)
                //color
                ColorViewEdit(habbit:$habbit)
                //show count
                ShowCountViewEdit(habbit: $habbit)
                //show streak
                ShowStreakViewEdit(habbit: $habbit)
                setAlarmEdit(habbit: $habbit, setAlarm: $setAlarm)
                //deleteBtnView
                DeleteBtnViewEdit(habitFormViewModel: habbitFormViewModel, habbit: $habbit)
              
            }
            .padding(.horizontal,24)
            
            
            
            
            
        }
        .sheet(isPresented:$setAlarm){
            TimePicker(hr: $hr, m: $m, setAlerm: $setAlarm, name: $habbit.name)
            
        }
        
        Spacer()
        
       
           
    }
      
}

struct EmojiCircleBtn:View{
    @FocusState private var isTextFieldFocused: Bool
    @EnvironmentObject var habbitListViewModel:HabbitListViewModel
    @Binding var habbit: Habbit
    var body:some View{
        ZStack{
            Circle()
                .fill(Color.signBox)
                .frame(width:60,height:60)
            
            
            if habbit.emoji.isEmpty{
                Button(action:{
                    habbitListViewModel.openEmoji = true
                },label:{Image(systemName: "plus")
                        .font(.system(size:24))
                        .foregroundColor(.white)
                })
            }else{
                
                Button(
                    action:{
                        habbitListViewModel.openEmoji = true
                    },
                    label:{
                        Text(habbit.emoji)
                                     .font(.system(size: 28))
                    }
                )
                

            }
            
            
            
            

        }
        .onTapGesture {
            isTextFieldFocused = true
        }
        .sheet(isPresented:$habbitListViewModel.openEmoji){
            
            EmojiPickerView(selectedEmoji: $habbit.emoji)
                .environmentObject(HabbitListViewModel())
                .presentationDetents([.medium])
            
        }
    }
}


struct NameViewEdit: View{
    @EnvironmentObject var habbitListViewModel:HabbitListViewModel
    @Binding var habbit: Habbit
    @FocusState var titleIsFocused: Bool
    var body:some View{
        HStack{
            TextField("Title",text: $habbit.name)
                .focused($titleIsFocused)
                .font(.system(size: 14,weight: .black))
                .foregroundColor(.white)
               
        
        }
        .padding(.horizontal,24)
        .padding(.top,26)
        .padding(.bottom,24)
        .background(Color.signBox)
        .cornerRadius(16)
    }
}

struct ColorViewEdit: View {
    @Binding var habbit: Habbit
    @State private var tempColor: Color = .blue

    var body: some View {
        HStack {
            Text("Color")
                .foregroundColor(.white)
                .font(.system(size: 14, weight: .black))

            Spacer()

            ColorPicker("", selection: $tempColor)
                .onChange(of: tempColor) {
                    habbit.color = tempColor.toHex() ?? "#0000FF"
                }
        }
        .onAppear {
            tempColor = Color(hexString: habbit.color)
        }
        .padding(.horizontal, 24)
        .padding(.top, 26)
        .padding(.bottom, 24)
        .background(Color.signBox)
        .cornerRadius(16)
    }
}


struct ShowCountViewEdit:View{
    @EnvironmentObject var habbitListViewModel:HabbitListViewModel
    @Binding var habbit: Habbit
    var body:some View{
        
        HStack{
            Toggle("Show count", isOn: $habbit.showCount)
                .font(.system(size:14,weight:.black))
                .foregroundColor(.white)
        }
        .padding(.horizontal,24)
        .padding(.top,26)
        .padding(.bottom,24)
      
        .background(Color.signBox)
        .cornerRadius(16)
        
    }
}



struct ShowStreakViewEdit:View{
    @EnvironmentObject var habbitListViewModel:HabbitListViewModel
    @Binding var habbit: Habbit
    var body:some View{
        HStack{
            Toggle("Show streak", isOn: $habbit.showStreak)
                .font(.system(size:14,weight: .black))
                .foregroundColor(.white)
        }
        .padding(.horizontal,24)
        .padding(.top,26)
        .padding(.bottom,24)
      
        .background(Color.signBox)
        .cornerRadius(16)
        
    }
    
}

struct setAlarmEdit:View{
    @EnvironmentObject var habbitListViewModel:HabbitListViewModel
    @Binding var habbit: Habbit
    
    @Binding var setAlarm:Bool
    var body:some View{
        HStack{
            Toggle("SetAlarm", isOn: $setAlarm)
                .font(.system(size:14,weight: .black))
                .foregroundColor(.white)
        }
        .padding(.horizontal,24)
        .padding(.top,26)
        .padding(.bottom,24)
      
        .background(Color.signBox)
        .cornerRadius(16)
        
    }
    
}


struct DeleteBtnViewEdit: View{
    @EnvironmentObject var habbitListViewModel:HabbitListViewModel
    @ObservedObject var habitFormViewModel: HabitFormViewModel
    @Binding var habbit: Habbit
    
    
    var body:some View{
        HStack{
            Spacer()
            Button(action: {
                habbitListViewModel.removeItem(habbit.id)
                habbitListViewModel.loading = true
                habbitListViewModel.shouldDismissToList = true
                habbitListViewModel.navBarType = "default"
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        habbitListViewModel.showEdit = false
                    }
                
            }, label: {
               
                if habbitListViewModel.loading{
                    Spinner()

                }else{
                    Text("Delete")
                        .font(.system(size: 14,weight:.black))
                        .foregroundColor(.red)
                }
                
               
              
            }
            
            )
            Spacer()
        }
        .padding(.horizontal,24)
        .padding(.top,26)
        .padding(.bottom,24)
      
        .background(Color.signBox)
        .cornerRadius(16)
    }
}




struct SettingPreviewWrapper: View {
    @State var habbit = Habbit( // ✅ 바인딩을 가능하게 하려면 @State로 직접 소유해야 함
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
        Setting(habbitFormViewModel: HabitFormViewModel(), habbit: $habbit)
            .environmentObject(HabbitListViewModel())
    }
}

#Preview {
    Setting( habbitFormViewModel: HabitFormViewModel(), habbit: .constant( .init(id: .init(), name: "운동", countOfDay: 0, lastUpdatedDate: nil, startDate: .now, didIt: [], emoji: "💪", color: "#FF5733", showCount: true, showStreak: true) ) ) .environmentObject(HabbitListViewModel())
    
}
    

