//
//  HabitStorage.swift
//  Habbits
//
//  Created by Ji y LEE on 5/13/25.
//

import Foundation



// MARK: - Habit 저장소
class HabitStorage: ObservableObject {
    @Published var habits: [Habbit] = []

    private let key = "habits"

    init() {
        loadHabits()
    }

    func addHabit(_ habit: Habbit) {
        habits.append(habit)
        saveHabits()
    }

    func updateHabit(_ habit: Habbit) {
        if let index = habits.firstIndex(where: { $0.name == habit.name }) {
            habits[index] = habit
            saveHabits()
        }
    }

    func deleteHabit(at offsets: IndexSet) {
        habits.remove(atOffsets: offsets)
        saveHabits()
    }

    private func saveHabits() {
        if let data = try? JSONEncoder().encode(habits) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }

    private func loadHabits() {
        if let data = UserDefaults.standard.data(forKey: key),
           let decoded = try? JSONDecoder().decode([Habbit].self, from: data) {
            habits = decoded
        }
    }
}
