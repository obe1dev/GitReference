//
//  GRViewController.m
//  GitReference
//
//  Created by Brock Oberhansley on 9/15/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "GRViewController.h"

static CGFloat margin = 15;
static NSString * const Command = @"command";
static NSString * const Reference = @"reference";



@interface GRViewController ()

@end

@implementation GRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //making scroll view
    //scroll view color
    self.view.backgroundColor = [UIColor blackColor];
    // alloc and creating the size.
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:scrollView];
    
    
    //title for the scroll view
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(110 , 10, self.view.frame.size.width,50)];
    //set color
    title.textColor = [UIColor redColor];
    //entering the text
    title.text = @"GitReference";
    //adding a view to the scrool view
     [scrollView addSubview:title];
    
    CGFloat space = 70;
    
    
    //
    for (NSDictionary *gitCommands in [self gitCommands] ) {
        
        //fetch the command and referance from the array and put them as a property
        NSString * command = gitCommands[Command];
        NSString * referance = gitCommands[Reference];
        
        UILabel *gitCommands = [[UILabel alloc]initWithFrame:CGRectMake(margin, space, self.view.frame.size.width, 30)];
        
        gitCommands.font = [UIFont boldSystemFontOfSize:20];
        gitCommands.textColor =[UIColor redColor];
        gitCommands.text = command;
        //adding the command from the array to the scrollview
        [scrollView  addSubview:gitCommands];
        
        space += 30;
        
        //
        UILabel *gitReferance = [[UILabel alloc]initWithFrame:CGRectMake(margin, space, self.view.frame.size.width, 20)];
        gitReferance.textColor = [UIColor greenColor];
        gitReferance.text = referance;
        
        [scrollView addSubview:gitReferance];
        
        space += 50;
        
        scrollView.contentSize = CGSizeMake(self.view.frame.size.width, space);
        
    }
    
}

- (NSArray *)gitCommands {
    
    return @[@{Command: @"git status", Reference: @": shows changed files"},
             @{Command: @"git diff", Reference: @": shows actual changes"},
             @{Command: @"git add .", Reference: @": adds changed files to the commit"},
             @{Command: @"git commit -m \"notes\"", Reference: @": commits the changes"},
             @{Command: @"git push origin _branch_", Reference: @": pushes commits to branch named _branch_"},
             @{Command: @"git log", Reference: @": displays progress log"},
             @{Command: @"git comment --amend", Reference: @": re-enter last commit message"}
             ];
    
}



- (CGFloat)heightOfReferenceString:(NSString *)reference {
    
    CGRect bounding = [reference boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin, 0)
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}
                                              context:nil];
    
    return bounding.size.height;
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
