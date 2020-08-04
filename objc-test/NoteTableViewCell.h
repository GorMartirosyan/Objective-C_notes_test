//
//  NoteTableViewCell.h
//  objc-test
//
//  Created by Artur Hakobyan on 6/7/20.
//  Copyright © 2020 Artur Hakobyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Note;
@interface NoteTableViewCell : UITableViewCell

- (void)setupWithNote:(Note *)note;

@end
