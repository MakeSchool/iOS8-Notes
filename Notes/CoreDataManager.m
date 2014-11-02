//
//  CoreDataManager.m
//  Notes
//
//  Created by Daniel Haaser on 11/1/14.
//  Copyright (c) 2014 MakeSchool. All rights reserved.
//

#import "CoreDataManager.h"
#import "AppDelegate.h"
#import "Note.h"

@implementation CoreDataManager

#pragma mark - Lifecycle

+ (instancetype)sharedManager {
    static CoreDataManager *sharedManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    
    return sharedManager;
}

#pragma mark - Core Data

- (void)saveContext {
    AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext* context = appDelegate.managedObjectContext;
    
    NSError* error = nil;
    
    [context save:&error];
    
    if (error) {
        // Oh boy, it's all gone wrong.
    }
}

- (Note*)createNewNote {
    AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext* context = appDelegate.managedObjectContext;
    Note* newNote = (Note*) [NSEntityDescription insertNewObjectForEntityForName:@"Note" inManagedObjectContext:context];
    
    [self saveContext];
    
    return newNote;
    
}

- (void)deleteNote:(Note*)note {
    AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext* context = appDelegate.managedObjectContext;
    
    [context deleteObject:note];
    
    [self saveContext];
}

- (NSArray*)fetchNotes {
    AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext* context = appDelegate.managedObjectContext;
    
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Note" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    NSError* error;

    NSArray* array = [context executeFetchRequest:request error:&error];
    if (array == nil) {
        //error handling, e.g. display error to user
    }
    
    return array;
}

@end
