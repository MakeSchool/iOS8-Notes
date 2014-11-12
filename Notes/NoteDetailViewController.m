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
{
    BOOL textViewPlaceholderTextPresent;
}

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.contentTextView.delegate = self;
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.titleTextField.text = self.note.title;
    
    if (!self.note.content) {
        self.contentTextView.text = @"Type your note here!";
        textViewPlaceholderTextPresent = YES;
    } else {
        self.contentTextView.text = self.note.content;
        textViewPlaceholderTextPresent = NO;
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.note.title = self.titleTextField.text;
    self.note.content = self.contentTextView.text;
}

#pragma mark - TextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView {
    if (textViewPlaceholderTextPresent) {
        self.contentTextView.text = @"";
    }
}

@end