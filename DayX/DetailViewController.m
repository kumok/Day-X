//
//  DetailViewController.m
//  DayX
//
//  Created by Duc Ho on 1/13/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"
#import "Entry.h"

@interface DetailViewController () <UITextFieldDelegate, UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *button;

@property (strong, nonatomic) Entry *entry;

@end

//static NSString *entryName = @"Entry";
//static NSString *titleKey = @"Title";
//static NSString *textKey = @"Text";

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textField.delegate = self;
    // Do any additional setup after loading the view from its nib.
    self.textView.delegate = self;
    
//    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    
//    NSDictionary *myDict = [defaults valueForKey:entryName];
//    [self updateWithDictionary:myDict];
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)];
    self.navigationItem.rightBarButtonItem = saveButton;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self save:textField];
}

- (void)textViewDidChange:(UITextView *)textView {
    [self save:textView];
}


- (IBAction)clear:(id)sender {
    self.textField.text = @"";
    self.textView.text = @"";
    
    [self save:sender];

}

- (IBAction)save:(id)sender {
    if (!self.entry) {
        self.entry = [[Entry alloc] init];
        self.entry.title = self.textField.text;
        self.entry.text = self.textView.text;

    }
    
    NSMutableArray *entries = [Entry loadEntriesFromDefaults];
    [entries addObject:self.entry];
    
    [Entry storeEntriesInDefaults:entries];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)updateWithDictionary:(NSDictionary *)dict {
    self.textField.text = dict[titleKey];
    self.textView.text = dict[textKey];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
