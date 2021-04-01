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
    
    func recruitHeroToSquad(_ hero: HeroType, withThumbnail thumbnail: UIImage?) {
        guard let context = context, let heroEntity = NSEntityDescription.entity(forEntityName: "CoreDataHero", in: context) else { return }
        let coreHero = NSManagedObject(entity: heroEntity, insertInto: context)
        coreHero.setValue(hero.name, forKey: "name")
        coreHero.setValue(hero.id, forKey: "id")
        coreHero.setValue(hero.biography, forKey: "biography")
        coreHero.setValue(hero.thumbnail, forKey: "thumbnailPath")
        if let imageData = thumbnail?.pngData() {
            coreHero.setValue(imageData, forKey: "image")
        }
        
        do {
            try context.save()
        } catch {
            print("error on saving")
        }
    }
    
    func removeHeroFromSquad(heroID id: Int) {
        DispatchQueue.main.async {
            guard let context = self.context else { return }
            let heroFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CoreDataHero")
            
            heroFetchRequest.predicate = NSPredicate(format: "id = %i", id)
            
            guard let heroToDelete = try? context.fetch(heroFetchRequest).first as? NSManagedObject else { return }
            context.delete(heroToDelete)
            
            do {
                try context.save()
            } catch {
                print("Failed to fetch hero from CoreData and delete")
            }
        }
    }
    
    func retriveSquad() -> [HeroType] {
        var heroes: [HeroType] = .init()
        guard let context = self.context else {
            return .init()
        }
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CoreDataHero")
        do {
            guard let result = try context.fetch(fetchRequest) as? [NSManagedObject] else {
                return .init()
            }
            for data in result {
                var hero = APIHero()
                if let id = data.value(forKey: "id") as? Int,
                   let name = data.value(forKey: "name") as? String,
                   let imageData = data.value(forKey: "image") as? Data,
                   let biography = data.value(forKey: "biography") as? String,
                   let fullPath = data.value(forKey: "thumbnailPath") as? String {
                    hero.id = id
                    hero.name = name
                    hero.imageData = imageData
                    hero.description = biography
                    hero.thumbnail = .init(withFullPath: fullPath)
                    heroes.append(HeroAdapter(withAPIHero: hero))
                }
            }
            
            return heroes
            
        } catch {
            return .init()
        }
    }
}
