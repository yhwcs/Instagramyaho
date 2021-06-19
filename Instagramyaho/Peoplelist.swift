//
//  Peoplelist.swift
//  Instagramyaho
//
//  Created by RelMac User Exercise1 on 2021/06/19.
//

import Foundation

class Peoplelist: ObservableObject {
    
    // Initialzation
    init() {
        loadPeoplelistItems()
    }
    
    @Published var items: [PeoplelistItem] = []
    
    // Method
    func printPeoplelistContents() {
        for item in items {
            print(item)
        }
    }
    
    func deleteListItem(whichElement: IndexSet) {
        items.remove(atOffsets: whichElement)
        printPeoplelistContents()
    }
    
    func moveListItem(whichElement: IndexSet, destination: Int) {
        items.move(fromOffsets: whichElement, toOffset: destination)
        printPeoplelistContents()
    }
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let directory = paths[0]
        print("Documents directory is: \(directory)")
        return directory
    }
    
    func dataFilePath() -> URL {
        let filePath = documentsDirectory().appendingPathComponent("Peoplelist.plist")
        print("Data file path is: \(filePath)")
        return filePath
    }
    
    func savePeoplelistItems(){
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
    
    func loadPeoplelistItems(){
        print("Loading checklist Items")
        
        let path = dataFilePath()
        
        if let data = try? Data(contentsOf: path){
            let decoder = PropertyListDecoder()
            do {
                items = try decoder.decode([PeoplelistItem].self, from: data)
                print("Checklist items loaded")
            } catch {
                print("Error decoding item array: \(error.localizedDescription)")
            } // End of catch
        } // End of if
    } // End of function
    
}
