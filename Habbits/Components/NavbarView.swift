//
//  NavbarView.swift
//  Habbits
//
//  Created by Ji y LEE on 5/12/25.
//

import SwiftUI
//import SwiftUICore
struct NavbarView: View {
    @ObservedObject var habitFormViewModel: HabitFormViewModel
    @EnvironmentObject var habbitListViewModel : HabbitListViewModel
  
    let rightSideBtnType:String
    let onBack:(()->Void)?
    let rightBtnF:(()->Void)?
    var body: some View {
        if rightSideBtnType == "form" {
          
           FormNavView(rightBtnFunc: {
               
               
               habbitListViewModel.addHabbit(
                habitFormViewModel.toHabbit()
               )
           }, leftBtnFunc: {habbitListViewModel.closeModel()},
                       
           
           )
        }
        
       else if rightSideBtnType == "default"{
            DefaultView(rightBtnFunc: habbitListViewModel.rightBtnFunc)
        }
        
      else  if rightSideBtnType == "detail"{
          DetailNavView(rightBtnFunc:{habbitListViewModel.rightBtnFuncEdit()},leftBtnFunc: {
                onBack!()
              
            })
        }
        else if rightSideBtnType == "setting"{
            SettingNavView(rightBtnFunc:{rightBtnF!()},leftBtnFunc: {habbitListViewModel.clseModelEdit()})
        }
        else{
            EmptyView()
        }
       
    }
}


struct DefaultView : View {
    let rightBtnFunc : () -> Void
  
    var body:some View{
        HStack{

            Spacer()
            Button(action: {
                rightBtnFunc()
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
        
        .background(.black)
        .padding(.horizontal,24)
        
    }
}


struct DetailNavView :View{

    let rightBtnFunc : () -> Void
    let leftBtnFunc : () -> Void
    var  body:some View{
        HStack{
            Button(action: {
                leftBtnFunc()
                print("FormViewBtn")
            }, label: {
                Circle()
                    .fill(Color.signBox)
                    .frame(width:32,height:32)
                    .overlay(
                        Image(systemName: "chevron.backward")
                        
                            .font(.system(size: 16))
                            .foregroundColor(.white)
   
                    )
                  
            }
                   
            )
       
            Spacer()
            Button(action: {
                rightBtnFunc()
            }, label: {
                Circle()
                    .fill(Color.signBox)
                    .frame(width:32,height:32)
                    .overlay(
                        Image(systemName: "gearshape")
                        
                            .font(.system(size: 16))
                            .foregroundColor(.white)
  
                    )
                             
            }
                   
            )

        }
        
        .background(.black)
        .padding(.horizontal,24)
       
        
    }
}



struct FormNavView :View{
    let rightBtnFunc : () -> Void
    let leftBtnFunc : () -> Void
    var  body:some View{
        HStack{

       
            Spacer()
            Button(action: {
             rightBtnFunc()
                
            }, label: {
                Text("Done")
                    .font(.system(size: 14,weight: .bold))
                    .foregroundColor(.white)
                             
            }
                   
            )

        }
        
        .background(.black)
        .padding(.horizontal,24)
        
    }
}




struct SettingNavView :View{
    let rightBtnFunc : () -> Void
    let leftBtnFunc : () -> Void
    var  body:some View{
        HStack{

       
            Spacer()
            Button(action: {
             rightBtnFunc()
                
            }, label: {
                Text("Done")
                    .font(.system(size: 14,weight: .bold))
                    .foregroundColor(.white)
                             
            }
                   
            )

        }
        

        .padding(.horizontal,24)
        
    }
}






struct NavbarView_Previews: PreviewProvider {
 
    @State static var previewRightSideBtnType = "form"
    static var previews: some View {
        NavbarView( habitFormViewModel: HabitFormViewModel(), rightSideBtnType: previewRightSideBtnType, onBack: nil, rightBtnF: nil)
            .environmentObject(HabbitListViewModel())
    }
}
