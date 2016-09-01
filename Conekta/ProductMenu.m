//
//  ProductMenu.m
//  Conekta
//
//  Created by Jorge Jhamil Pineda Echeverria on 31/08/16.
//  Copyright © 2016 jjpe. All rights reserved.
//

#import "ProductMenu.h"

@interface ProductMenu ()
@property NSMutableArray *productArray;
@end

@implementation ProductMenu

/**********************************************************************************************/
#pragma mark - Initialization methods
/**********************************************************************************************/


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initController {
    self.productArray   = [[NSMutableArray alloc] initWithObjects: @"jetta", @"ibiza", @"chevy", @"jeep", @"bora", @"mustang", @"mustang", @"ferrari", @"BMW serie 1", @"BMW serie 2", nil];
    
    //self.avengerImgs   = [[NSMutableArray alloc] initWithObjects: @"captain.png", @"ironman.png", @"blackwidow.png", @"hulk.png", @"thor.png", @"spiderman.png", nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)BuyButtonPressed:(id)sender {
    
    [self performSegueWithIdentifier:@"Start" sender:self];
    
}


/*************************/
#pragma mark - Navigation
/*************************/
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //print(NSLog(@"prepareForSegue"))
    //if([segue.destinationViewController isKindOfClass:[AlertDetails class]]){
        
    //}
}





/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.productArray.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Initialize cells
    cellProduct *cell = (cellProduct *)[tableView dequeueReusableCellWithIdentifier:@"cellProduct"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellProduct" bundle:nil] forCellReuseIdentifier:@"cellProduct"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellProduct"];
    }
    //Fill cell with info from arrays
    //cell.lblName.text       = self.avengerNames[indexPath.row];
    //cell.imgAvenger.image   = [UIImage imageNamed:self.avengerImgs[indexPath.row]];
    
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end
