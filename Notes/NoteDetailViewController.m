//
//  NotesDetailViewController.m
//  Notes
//
//  Created by Benjamin Encz on 11/09/14.
//  Copyright (c) 2014 MakeSchool. All rights reserved.
//

#import "NoteDetailViewController.h"
#import "Note.h"

@interface NoteDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;

@end

@implementation NoteDetailViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.titleTextField.text = self.note.title;
    self.contentTextView.text = self.note.content;
}

@end
