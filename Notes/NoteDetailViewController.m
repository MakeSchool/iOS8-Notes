//
//  NotesDetailViewController.m
//  Notes
//
//  Created by Benjamin Encz on 11/09/14.
//  Copyright (c) 2014 MakeSchool. All rights reserved.
//

#import "NoteDetailViewController.h"
#import "Note.h"
#import "CoreDataManager.h"

@interface NoteDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;

@end

@implementation NoteDetailViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.titleTextField.text = self.note.title;
    self.contentTextView.text = self.note.content;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // Save the note if one was actually created

    if (![self fieldsAreEmpty]) {
        self.note.title = self.titleTextField.text;
        self.note.content = self.contentTextView.text;
    
        [[CoreDataManager sharedManager] saveContext];
    } else {
        // Otherwise, delete the empty note
        [[CoreDataManager sharedManager] deleteNote:self.note];
    }
}

- (BOOL)fieldsAreEmpty {
    // Remove all the white space, and see if any real characters are left over
    BOOL fieldsAreEmpty = NO;
    
    NSArray* titleTextWords = [self.titleTextField.text componentsSeparatedByCharactersInSet :[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSArray* contentTextWords = [self.titleTextField.text componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([titleTextWords[0] isEqualToString:@""] && [contentTextWords[0] isEqualToString:@""]) {
        fieldsAreEmpty = YES;
    }

    return fieldsAreEmpty;
}

@end