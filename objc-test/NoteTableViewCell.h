//
//  NoteTableViewCell.h
//  objc-test
//
//  Created by Gor on 6/7/20.
//  Copyright © 2020 user1. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Note;
@interface NoteTableViewCell : UITableViewCell

- (void)setupWithNote:(Note *)note;

@end
