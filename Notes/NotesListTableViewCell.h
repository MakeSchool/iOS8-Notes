//
//  NotesListTableViewCell.h
//  Notes
//
//  Created by Daniel Haaser on 11/11/14.
//  Copyright (c) 2014 MakeSchool. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotesListTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblNotePreview;

@end
