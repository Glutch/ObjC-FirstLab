#import "GithubViewController.h"
#import "NSObject+Global.h"

@interface GithubViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *repos;
@property (weak, nonatomic) IBOutlet UITableView *reposTable;
@property (nonatomic) NSMutableArray *reposArray;
@end

@implementation GithubViewController

- (void)viewDidLoad {
    self.reposArray = [[NSMutableArray alloc] init];
    [super viewDidLoad];
    self.view.backgroundColor = [self getThemeColor];
    [self generateProfile];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.reposArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [self.reposArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)generateProfile {
    NSDictionary *glutch = [self fetch:@"https://api.github.com/users/glutch"];
    NSArray *glutchRepos = [self fetch:@"https://api.github.com/users/Glutch/repos"];

    //Profile Picture
    NSData *profilePictureUrl = [NSData dataWithContentsOfURL:[NSURL URLWithString:glutch[@"avatar_url"]]];
    self.profilePicture.image = [UIImage imageWithData:profilePictureUrl];

    //Username
    self.username.text = glutch[@"login"];

    //Repos
    self.repos.text = [NSString stringWithFormat:@"%@", glutch[@"public_repos"]];
    
    //Repos
    for (NSDictionary* repo in glutchRepos) {
        [self.reposArray addObject:[NSString stringWithFormat: @"%@", repo[@"name"]]];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
