//
//  ViewController.m
//  objc-test
//
//  Created by Gor on 6/7/20.
//  Copyright © 2020 user1. All rights reserved.
//

#import "ViewController.h"
#import "NoteTableViewCell.h"
#import "Note.h"

@interface ViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *notesArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.notesArray = [[self getNotes] mutableCopy] ?: [NSMutableArray array];
}

- (IBAction)addAction:(UIBarButtonItem *)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"New Note" message:@"Add Note data" preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:nil];
    [alert addTextFieldWithConfigurationHandler:nil];
    [alert addAction:[UIAlertAction actionWithTitle:@"Save"
                                              style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction *action) {
        if (alert.textFields.count && alert.textFields[0].text.length && alert.textFields[1].text.length) {
            [self addNoteWithTitle:alert.textFields[0].text andSubTitle:alert.textFields[1].text];
        }
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel"
                                              style:UIAlertActionStyleDefault
                                            handler:nil]];
    [self presentViewController:alert animated:true completion:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NoteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NoteTableViewCell"
                                                              forIndexPath:indexPath];
    [cell setupWithNote:(Note *)self.notesArray[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.notesArray.count;
}

- (void)addNoteWithTitle:(NSString *)title andSubTitle:(NSString *)subTitle {
    Note *note = [[Note alloc] initWithTitle:title
                                 andSubTitle:subTitle];
    [[self notesArray] addObject:note];
    [self saveNotes:[[self notesArray] copy]];
    [[self tableView] reloadData];
}

- (void)saveNotes:(NSArray *)notes {
    NSError *error = nil;
    NSData *notesData = [NSKeyedArchiver archivedDataWithRootObject:notes
                                              requiringSecureCoding:YES
                                                              error:&error];
    NSLog(@"NSKeyedArchiver Error: %@",error);
    if (notesData) {
        [[NSUserDefaults standardUserDefaults] setObject:notesData
                                                  forKey:@"Notes"];
    }
}

- (NSArray *)getNotes {
    NSData *notesData = [[NSUserDefaults standardUserDefaults] objectForKey:@"Notes"];
    if (!notesData) {
        return nil;
    }
    NSError *error = nil;
    NSSet *classes = [NSSet setWithObjects:[Note class], [NSArray class], nil];
    NSArray *notes = [NSKeyedUnarchiver unarchivedObjectOfClasses:classes fromData:notesData error:&error];
    NSLog(@"NSKeyedUnarchiver Error: %@",error);
    return notes;
}
@end
