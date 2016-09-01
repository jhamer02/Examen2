//
//  ProductMenu.m
//  Conekta
//
//  Created by Jorge Jhamil Pineda Echeverria on 31/08/16.
//  Copyright © 2016 jjpe. All rights reserved.
//

#import "ProductMenu.h"
#import "Start.h"

@interface ProductMenu ()
@property NSMutableArray *productTitle;
@property NSMutableArray *productPhotos;
@property NSMutableArray *productDescription;

@property NSString *stPhotoselected;
@property NSString *stProductselected;
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
    self.productTitle   = [[NSMutableArray alloc] initWithObjects: @"bmw6", @"camaro", @"cruze", @"forte", @"jac", @"jetta", @"mazda3", @"panamera", @"passat", @"tyler", nil];
    
    self.productPhotos   = [[NSMutableArray alloc] initWithObjects: @"bmw6.png", @"camaro.png", @"cruze.png", @"forte.png", @"jac.png", @"jetta.png", @"mazda3.png", @"panamera.png", @"passat.png", @"tyler.png", nil];
    
    self.productDescription   = [[NSMutableArray alloc] initWithObjects: @"$100,000", @"$200,000", @"$300,000", @"$400,000", @"$500,000", @"$600,000", @"$700,000", @"$800,000", @"$900,000", @"$900,000", nil];
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
    if([segue.destinationViewController isKindOfClass:[Start class]]){
        Start *starter = [segue destinationViewController];
        starter.productTitle = self.stProductselected;
        starter.productPhoto = self.stPhotoselected;        
    }
}





/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.productTitle.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 190;
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
    cell.lblProduct.text       = self.productTitle[indexPath.row];
    cell.imgProduct.image   = [UIImage imageNamed:self.productPhotos[indexPath.row]];
    
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.stProductselected       = self.productTitle[indexPath.row];
    self.stPhotoselected   = self.productPhotos[indexPath.row];
    
    [self performSegueWithIdentifier:@"Start" sender:self];
}


@end
