//
//  LocalService.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 29/03/2021.
//

import CoreData
import UIKit

class LocalService: HeroesLocalRepositoryProtocol {
    
    private var context: NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        return appDelegate.persistentContainer.viewContext
    }
    
    func recruitHeroToSquad(_ hero: Hero, withThumbnail thumbnail: UIImage?) {
        guard let context = context, let heroEntity = NSEntityDescription.entity(forEntityName: "CoreDataHero", in: context) else { return }
        let coreHero = NSManagedObject(entity: heroEntity, insertInto: context)
        coreHero.setValue(hero.name, forKey: "name")
        coreHero.setValue(hero.id, forKey: "id")
        if let imageData = thumbnail?.pngData() {
            coreHero.setValue(imageData, forKey: "image")
        }
        
        do {
            try context.save()
        } catch {
            print("error on saving")
        }
    }
    
    func removeHeroFromSquad(_ hero: Hero) {
        DispatchQueue.main.async {
            guard let context = self.context else { return }
            let heroFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CoreDataHero")

            heroFetchRequest.predicate = NSPredicate(format: "id = %i", hero.id ?? .init())
            
            guard let heroToDelete = try? context.fetch(heroFetchRequest).first as? NSManagedObject else { return }
            context.delete(heroToDelete)
            
            do {
                try context.save()
            } catch {
                print("Failed to fetch hero from CoreData and delete")
            }
        }
    }
    
    func retriveSquad() -> [Hero] {
        var heroes: [Hero] = .init()
        guard let context = self.context else {
            return .init()
        }
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CoreDataHero")
        do {
            guard let result = try context.fetch(fetchRequest) as? [NSManagedObject] else {
                return .init()
            }
            for data in result {
                var hero = Hero()
                hero.id = data.value(forKey: "id") as? Int
                hero.name = data.value(forKey: "name") as? String
                hero.imageData = data.value(forKey: "image") as? Data
                heroes.append(hero)
            }
            
            return heroes
            
        } catch {
            return .init()
        }
    }
}
