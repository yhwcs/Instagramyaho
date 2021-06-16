//
//  Resultlist.swift
//  Instagramyaho
//
//  Created by RelMac User Exercise1 on 2021/06/16.
//

import Foundation

class Resultlist: ObservableObject {
    
    // Initialzation
    init() {
        loadResultlistItems()
    }
    
    /*
    @Published var items = [ChecklistItem(name: "Walk the dog", isChecked: false),
                            ChecklistItem(name: "Brush my teeth", isChecked: false),
                            ChecklistItem(name: "Learn iOS development", isChecked: true),
                            ChecklistItem(name: "Soccer practice", isChecked: false),
                            ChecklistItem(name: "Eat ice cream", isChecked: true),]
    */
    @Published var items: [ResultlistItem] = []
    
    // Method
    func printResultlistContents() {
        for item in items {
            print(item)
        }
    }
    
    func deleteListItem(whichElement: IndexSet) {
        items.remove(atOffsets: whichElement)
        printResultlistContents()
    }
    
    func moveListItem(whichElement: IndexSet, destination: Int) {
        items.move(fromOffsets: whichElement, toOffset: destination)
        printResultlistContents()
    }
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let directory = paths[0]
        print("Documents directory is: \(directory)")
        return directory
    }
    
    func dataFilePath() -> URL {
        let filePath = documentsDirectory().appendingPathComponent("Resultlist.plist")
        print("Data file path is: \(filePath)")
        return filePath
    }
    
    func saveResultlistItems(){
        print("Saving checklist items")
        
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(items)
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
            print("Checklist items saved")
        } catch {
            print("Error encoding item array: \(error.localizedDescription)")
        } // End of try
    } // End of function
    
    func loadResultlistItems(){
        print("Loading checklist Items")
        
        let path = dataFilePath()
        
        if let data = try? Data(contentsOf: path){
            let decoder = PropertyListDecoder()
            do {
                items = try decoder.decode([ResultlistItem].self, from: data)
                print("Checklist items loaded")
            } catch {
                print("Error decoding item array: \(error.localizedDescription)")
            } // End of catch
        } // End of if
    } // End of function
}
