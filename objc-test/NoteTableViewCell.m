//
//  NoteTableViewCell.m
//  objc-test
//
//  Created by Gor on 6/7/20.
//  Copyright © 2020 user1. All rights reserved.
//

#import "NoteTableViewCell.h"
#import "Note.h"

@interface NoteTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;

@end

@implementation NoteTableViewCell

- (void)setupWithNote:(Note *)note {
    _titleLabel.text = note.title;
    _subTitleLabel.text = note.subTitle;
}

@end
