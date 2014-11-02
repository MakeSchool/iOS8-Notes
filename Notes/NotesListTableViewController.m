//
//  NotesListTableViewController.m
//  Notes
//
//  Created by Benjamin Encz on 10/09/14.
//  Copyright (c) 2014 MakeSchool. All rights reserved.
//

#import "NotesListTableViewController.h"
#import "Note.h"
#import "NoteDetailViewController.h"
#import "CoreDataManager.h"

@interface NotesListTableViewController ()

@property (nonatomic, strong) NSMutableArray *notes;

@end

@implementation NotesListTableViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        _notes = [NSMutableArray array];
    }
    
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    _notes = [[[CoreDataManager sharedManager] fetchNotes] mutableCopy];
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.notes count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NotesCell" forIndexPath:indexPath];
    cell.textLabel.text = [self.notes[indexPath.row] title];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    Note* noteToBeDeleted = [self.notes objectAtIndex:indexPath.row];
    [self.notes removeObjectAtIndex:indexPath.row];
    [[CoreDataManager sharedManager] deleteNote:noteToBeDeleted];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowNote"]) {
        NoteDetailViewController *noteDetailViewController = [segue destinationViewController];
        NSIndexPath *selectedIndexPath = self.tableView.indexPathForSelectedRow;
        noteDetailViewController.note = self.notes[selectedIndexPath.row];
    } else if ([segue.identifier isEqualToString:@"AddNote"]) {
        Note* note = [[CoreDataManager sharedManager] createNewNote];
        [self.notes addObject:note];
        NoteDetailViewController *noteDetailViewController = [segue destinationViewController];
        noteDetailViewController.note = note;
    }
}


@end
