//
//  ViewController.m
//  shadowBoxDemo
//
//  Created by Paul Capili on 2/14/21.
//

#import "ViewController.h"
#import "PcapCell.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // I needed to have my ViewController file 
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

//    VideoCell * cell = (VideoCell *)[tableView dequeueReusableCellWithIdentifier:@"main"];
 
    PcapCell *cell = (PcapCell *) [tableView dequeueReusableCellWithIdentifier:@"pcap"];
        
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // will work on this
    
}

@end
