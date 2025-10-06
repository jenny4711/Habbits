//
//  HabbitListViewModel.swift
//  Habbits
//
//  Created by Ji y LEE on 5/12/25.
//

import Foundation

class HabbitListViewModel:ObservableObject{
    @Published var habbits:[Habbit]
    @Published var showForm:Bool
    @Published var navBarType:String
    @Published var showEdit:Bool
    @Published var openEmoji:Bool
    @Published var shouldDismissToList = false
    @Published var loading:Bool

    let storage = HabitStorage()
    var totalOfHabbits: Int{
        return habbits.count
    }
    
    init(habbits: [Habbit] = [],showForm:Bool = false ,navBarType:String = "default",showEdit:Bool = false,openEmoji:Bool = false,loading:Bool = false) {
      self.habbits = storage.habits
//       self.habbits = []
        self.showForm = showForm
        self.showEdit = showEdit
        self.navBarType = navBarType
        self.openEmoji = openEmoji
        self.loading = loading
    }
}
extension HabbitListViewModel{
    func addHabbit(_ habbit: Habbit){
    
        if habbit.name != "" {
            print("what's in side ofHabbit:\(habbit)")
            habbits.append(habbit)
            storage.addHabit(habbit)
            
            print("what's in side ofHabbits:\(habbits)")
            
            showForm = false
            
        }else{
            showForm = false
            return
        }
       
       
    }
    
    
    func emojiViewClose(){
        openEmoji = false
    }
    
    func rightBtnFuncEdit(){
        showEdit = true
    }
    
    func clseModelEdit(){
        showEdit = false
    }
    
    func  rightBtnFunc(){
        showForm = true
    }
    
    func closeModel(){
        showForm = false
    }
    
    func removeItem(_ id:UUID){


        let indexes = habbits.enumerated()
            .filter{$0.element.id == id}
            .map{$0.offset}
        
        let indexSet = IndexSet(indexes)
        storage.deleteHabit(at: indexSet)
        habbits.removeAll(where: {$0.id == id})
        loading = false
        print(loading)
       
    }
    
    func addDidIt(to habbit:Habbit){
        if let index = habbits.firstIndex(where:{$0.name == habbit.name}){
           
                            habbits[index].addDidIt()
            storage.updateHabit(habbits[index])
                print(habbit.didIt)
                        
        }
    }
    
    func editHabbit(_ habbit:Habbit){
        if let index = habbits.firstIndex(where:{$0.id == habbit.id}){
            habbits[index] = habbit
            storage.updateHabit(habbit)
            print("fixed habbit\(habbit)")
        }
    }
    
    
    func calculateStreak(_ habbit:Habbit) -> Int{
        let didItSet = Set(habbit.didIt)
        print("diditSet:\(didItSet)")
        var streak  = 0
        for day in (1...habbit.countOfDay).reversed(){
          
            if didItSet.contains(day){
                print("day:\(day)")
                streak += 1
            }else{
                break
            }
        }
        return streak <= 1 ? 0 : streak
    }
    
    
    
    
    
    }
    
    
    
    
    

