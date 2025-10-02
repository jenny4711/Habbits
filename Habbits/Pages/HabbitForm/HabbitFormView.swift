//
//  HabbitFormView.swift
//  Habbits
//
//  Created by Ji y LEE on 5/12/25.
//

import SwiftUI

struct HabbitFormView: View {
    @EnvironmentObject var habbitListViewModel:HabbitListViewModel
    @StateObject var habbitFormViewModel: HabitFormViewModel
    
    var body: some View {
        
        VStack{
            Spacer()
                .frame(height:16)
            NavbarView(habitFormViewModel: habbitFormViewModel, rightSideBtnType: "form",onBack: nil, rightBtnF: nil)
            VStack(spacing:16){

                //emoji
                EmojiCircleButton( habitFormViewModel: habbitFormViewModel)
             
                //title
                NameView(habitFormViewModel: habbitFormViewModel)
                    .cornerRadius(20)
                //color
                ColorView(habitFormViewModel: habbitFormViewModel)
                    .cornerRadius(20)
                //show count
                
                ShowCountView(habitFormViewModel: habbitFormViewModel)
                    .cornerRadius(20)
                //show strea
                ShowStreakView(habitFormViewModel: habbitFormViewModel)
                    .cornerRadius(20)
                //delete
//                DeleteBtnView(habitFormViewModel: habbitFormViewModel)
//                    .environmentObject(habbitListViewModel)
//                    .cornerRadius(20)
            }
            .padding(.horizontal,24)
            
            
            
           
           
            Spacer()
            
            
        }
        
        .background(.black)
        
        
    }
      
}




//import SwiftUI

extension Character {
    var isEmoji: Bool {
        return unicodeScalars.contains { $0.properties.isEmoji }
    }
}

struct EmojiCircleButton: View {
    @FocusState private var isTextFieldFocused: Bool
    @EnvironmentObject var habbitListViewModel :HabbitListViewModel
    @ObservedObject var habitFormViewModel: HabitFormViewModel
    init( habitFormViewModel: HabitFormViewModel) {
       
        self.habitFormViewModel = habitFormViewModel
    }

    var body: some View {
        ZStack {
            Circle()
                .fill(Color.signBox)
                .frame(width: 60, height: 60)

            // ✅ ViewModel의 emoji 값으로 조건 분기
            if habitFormViewModel.emoji.isEmpty {
                Button(action: {habbitListViewModel.openEmoji = true}, label: {
                    Image(systemName: "plus")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                })

            } else {

                
                Button(action: {habbitListViewModel.openEmoji = true}, label: {
                    Text(habitFormViewModel.emoji)
                    .font(.system(size: 28))
                })
                
              
                
            }


        }
        .onTapGesture {
            isTextFieldFocused = true
        }
        .sheet(isPresented:$habbitListViewModel.openEmoji){
            
            EmojiPickerView(selectedEmoji: $habitFormViewModel.emoji)
                .environmentObject(HabbitListViewModel())
                .presentationDetents([.medium])
        }
    }
}

struct NameView : View{
    @ObservedObject var habitFormViewModel: HabitFormViewModel
    @FocusState var titleIsFocused: Bool
    
    init(habitFormViewModel: HabitFormViewModel) {
        self.habitFormViewModel = habitFormViewModel
       
    }
    
    var body:some View{
        HStack{
            
           
                TextField("Title",text: $habitFormViewModel.name)
                    .focused($titleIsFocused)
                    .font(.system(size: 14,weight: .black))
                    .foregroundColor(.white)
            
            
        
           
        }
        .padding(.horizontal,24)
        .padding(.top,26)
        .padding(.bottom,24)
        .background(Color.signBox)
        
        
    }
}


struct ColorView: View {
    @ObservedObject var habitFormViewModel: HabitFormViewModel
    
    
    init(habitFormViewModel: HabitFormViewModel) {
        self.habitFormViewModel = habitFormViewModel
    }

    var body: some View {
        HStack {
            Text("Color")
                .foregroundColor(.white)
                .font(.system(size:14,weight:.black))
            Spacer()
            ColorPicker("", selection: $habitFormViewModel.tempColor)
                .frame(maxWidth: .infinity)
               
        }
        .padding(.horizontal,24)
        .padding(.top,26)
        .padding(.bottom,24)
      
        .background(Color.signBox)

        
      
    }
}



struct ShowCountView: View{
    @ObservedObject var habitFormViewModel: HabitFormViewModel
    
    init(habitFormViewModel: HabitFormViewModel) {
        self.habitFormViewModel = habitFormViewModel
    }
    var  body: some View{
        HStack{
            Toggle("Show count", isOn: $habitFormViewModel.showCount)
                .font(.system(size:14,weight:.black))
                .foregroundColor(.white)
        }
        .padding(.horizontal,24)
        .padding(.top,26)
        .padding(.bottom,24)
      
        .background(Color.signBox)

    }
}


struct ShowStreakView: View{
    @ObservedObject var habitFormViewModel: HabitFormViewModel
    
    init(habitFormViewModel: HabitFormViewModel) {
        self.habitFormViewModel = habitFormViewModel
    }
    var  body: some View{
        HStack{
            Toggle("Show streak", isOn: $habitFormViewModel.showStreak)
                .font(.system(size:14,weight: .black))
                .foregroundColor(.white)
        }
        .padding(.horizontal,24)
        .padding(.top,26)
        .padding(.bottom,24)
      
        .background(Color.signBox)

    }
}

struct DeleteBtnView: View{
    @EnvironmentObject var habbitListViewModel:HabbitListViewModel
    @ObservedObject var habitFormViewModel: HabitFormViewModel
    
    init(habitFormViewModel: HabitFormViewModel) {
        self.habitFormViewModel = habitFormViewModel
    }
    
    var body:some View{
        HStack{
            Spacer()
            Button(action: {habbitListViewModel.removeItem(habitFormViewModel.id)}, label: {
                Text("Delete")
                    .font(.system(size: 14,weight:.black))
                    .foregroundColor(.red)
            }
            
            )
            Spacer()
        }
        .padding(.horizontal,24)
        .padding(.top,26)
        .padding(.bottom,24)
      
        .background(Color.signBox)
    }
}


#Preview {
    HabbitFormView(habbitFormViewModel: HabitFormViewModel())
        .environmentObject(HabbitListViewModel())
}
