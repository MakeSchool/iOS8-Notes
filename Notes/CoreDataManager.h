//
//  CoreDataManager.h
//  Notes
//
//  Created by Daniel Haaser on 11/1/14.
//  Copyright (c) 2014 MakeSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Note;

@interface CoreDataManager : NSObject

+ (instancetype)sharedManager;

- (void)saveContext;

- (Note*)createNewNote;
- (void)deleteNote:(Note*)note;
- (NSArray*)fetchNotes;

@end
