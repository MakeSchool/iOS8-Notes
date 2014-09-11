//
//  NotesDetailViewController.h
//  Notes
//
//  Created by Benjamin Encz on 11/09/14.
//  Copyright (c) 2014 MakeSchool. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Note;

@interface NoteDetailViewController : UIViewController

@property (nonatomic, strong) Note *note;

@end