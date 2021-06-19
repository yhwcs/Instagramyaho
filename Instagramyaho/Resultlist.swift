//
//  Resultlist.swift
//  Instagramyaho
//
//  Created by RelMac User Exercise1 on 2021/06/16.
//

import Foundation

class Resultlist {
    
    // Initialzation
    init() {
        loadResultlistItems()
    }
    
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

class ResultBluelist: Resultlist, ObservableObject {
    override func dataFilePath() -> URL {
        let filePath = documentsDirectory().appendingPathComponent("ResultBluelist.plist")
        print("Data file path is: \(filePath)")
        return filePath
    }
}

class ResultGreenlist: Resultlist, ObservableObject {
    override func dataFilePath() -> URL {
        let filePath = documentsDirectory().appendingPathComponent("ResultGreenlist.plist")
        print("Data file path is: \(filePath)")
        return filePath
    }
}

class ResultBlacklist: Resultlist, ObservableObject {
    override func dataFilePath() -> URL {
        let filePath = documentsDirectory().appendingPathComponent("ResultBlacklist.plist")
        print("Data file path is: \(filePath)")
        return filePath
    }
}

class ResultRedlist: Resultlist, ObservableObject {
    override func dataFilePath() -> URL {
        let filePath = documentsDirectory().appendingPathComponent("ResultRedlist.plist")
        print("Data file path is: \(filePath)")
        return filePath
    }
}

class ResultNavylist: Resultlist, ObservableObject {
    override func dataFilePath() -> URL {
        let filePath = documentsDirectory().appendingPathComponent("ResultNavylist.plist")
        print("Data file path is: \(filePath)")
        return filePath
    }
}

class ResultOrangelist: Resultlist, ObservableObject {
    override func dataFilePath() -> URL {
        let filePath = documentsDirectory().appendingPathComponent("ResultOrangelist.plist")
        print("Data file path is: \(filePath)")
        return filePath
    }
}

class ResultYellowlist: Resultlist, ObservableObject {
    override func dataFilePath() -> URL {
        let filePath = documentsDirectory().appendingPathComponent("ResultYellowlist.plist")
        print("Data file path is: \(filePath)")
        return filePath
    }
}

class ResultPurplelist: Resultlist, ObservableObject {
    override func dataFilePath() -> URL {
        let filePath = documentsDirectory().appendingPathComponent("ResultPurplelist.plist")
        print("Data file path is: \(filePath)")
        return filePath
    }
}
