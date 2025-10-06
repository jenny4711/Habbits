////
////  HabbitListView.swift
////  Habbits
////
////  Created by Ji y LEE on 5/12/25.
////
//
import SwiftUI

private struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct HabbitListView: View {
    @EnvironmentObject var habbitListViewModel: HabbitListViewModel
    @State private var showInlineTitle = false       // 타이틀 표시 여부
    @State private var showForm        = false
    private let threshold: CGFloat = 10
    
    
    var body: some View {

      
      NavigationStack{
           
         ScrollView(.vertical,showsIndicators: false){
             
              
                
                //------------
           
                 ForEach((habbitListViewModel.habbits).reversed(),id:\.name){
                     
                     habbit in
                     
                     NavigationLink{
                         DetailView(habbit:habbit, editableHabbit:habbit)
                             .navigationBarBackButtonHidden(true)
                            
                             
                     } label:{
                         HabbitListCellView(habbit: habbit)
                             .cornerRadius(20)
                             .padding(.bottom, 16)
                        
                     }
                     

                 }
             

                
            
            }//:scrollview

          .navigationTitle("Habbits")
       
          
          
          .toolbar{
              
              ToolbarItem(placement:.topBarTrailing){
                
                          ListNavBarView()

                
              }
          }

            
        }//scrollview
    
        
    }
    }


private struct ListNavBarView: View {
    @EnvironmentObject var habbitListViewModel: HabbitListViewModel
    
    fileprivate var body: some View {
        ZStack {
            

            Spacer()
            
            
            Button(action: {
                habbitListViewModel.showForm = true
           
            }, label: {
               Circle()
                    .fill(Color.signBox)
                    .frame(width:32,height:32)
                    .overlay(
                        Image(systemName: "plus.circle")
                        
                            .font(.system(size: 16))
                            .foregroundColor(.white)

                    )
   
            }
                
            )
            
            
            
        }

    }
}






struct HabbitListCellView:View{
    @EnvironmentObject var habbitListViewModel: HabbitListViewModel
    var habbit :Habbit
    
    init(habbit: Habbit) {
        self.habbit = habbit
    }
    
    
    var body:some View{
        
        VStack{
            
            HabbitListCellAbove(habbit: habbit)
            HabbitListCellBottom(habbit: habbit)
           
        }
        .frame(width:UIScreen.main.bounds.width-32)


        .cornerRadius(20)
        .background(
            Color.cellViewBlackBK
                .cornerRadius(20)
        )
      
        
        
        
    }
    
    
    struct HabbitListCellAbove:View{
        @EnvironmentObject var habbitListViewModel: HabbitListViewModel
        var habbit :Habbit
        let hapticFeedback = UINotificationFeedbackGenerator()
        var body:some View{
            HStack{
                //1st
                Circle()
                    .fill(Color.signBox)
                    .frame(width:40,height:40)
                    .overlay(
                   
                        Text("\(habbit.emoji)")
                    )
                
                //2nd
                VStack(alignment: .leading){
                    //                Text("prayTime")
                    Text("\(habbit.name)")
                        .padding(.bottom,4)
                        .font(.system(size: 14,weight: .black))
                        .foregroundColor(.textWhite)
                    
                    HabbitSubTitleView( habbit: habbit)
     
                }
                Spacer()
                    
                
                //3rd
                
                Button(action: {
                    hapticFeedback.notificationOccurred(.success)
                    habbitListViewModel.addDidIt(to: habbit)
                }, label: {
                    Circle()
                        .fill(habbit.didIt.contains(habbit.countOfDay) ? Color(hexString:habbit.color) : Color.signBox)
                        .frame(width:32,height:32)
                        .overlay(
                            Image(systemName: habbit.didIt.contains(habbit.countOfDay) ? "checkmark.circle" : "plus.circle")
                            
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                            
                        )
                    
                }
                       
                )
                
            }
            .frame(width:UIScreen.main.bounds.width-81)
            .background( Color.cellViewBlackBK)
            .padding(.top,16)
            .padding(.bottom,16)
             
            
        }
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
        

        let columns = Array(repeating: GridItem(.flexible(), spacing: 3), count: 14)
        
            var countOfDay: Int {
                    habbit.countOfDay
                }
        
        var body:some View{
            
            LazyVGrid(columns: columns, spacing: 9) {
                ForEach((0..<countOfDay).reversed(), id: \.self) { num in
                    Circle()
                        .fill(habbit.didIt.contains(num+1) ? Color(hexString:habbit.color) : Color.signBox)
                        .frame(width: 14, height: 14)
                    
                }
                
            }
            .frame(width:UIScreen.main.bounds.width-81)
            .background(Color.cellViewBlackBK)
            .padding(.bottom,16)
            
            
        }
    }
    
    
    #Preview {
        HabbitListView()
            .environmentObject(HabbitListViewModel())
    }
}
