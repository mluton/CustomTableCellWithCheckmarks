This is a simple demonstration of how to use the a checkmark with a custom table view cell.

The application is based on the Single View Application template. The primary nib contains `UITableView` which occupies its entire visible space. There's a second nib for the custom table view cell which contains only a label. The font of the label is set to Copperplate to visually reinforce this is a custom table cell. I know it's possible to change the font of a default table view cell programmatically but the lack of code doing this in `ViewController.m` should make it obvious it's a custom cell. Also, the point of this application is to demonstrate the checkmark in the custom table view cell and not the crazy things you can do with custom table view cells.

Custom table view cells still recognize the `accessoryType` property the same way the default cells do. In `cellForRowAtIndexPath` this line will add the checkmark.

    cell.accessoryType = UITableViewCellAccessoryCheckmark;

Assuming we want the checkmarks to indicate a mutually-exclusive selection the interesting code occurs in `didSelectRowAtIndexPath`. You'll need an instance variable to keep track of which items is currently selected.  Since this sample application consists of a list of states I calling this variable `selectedState`.

1. Store value of `selectedState` in a local variable called `previousSelection`. We haven't updated `selectedState` yet so this will serve as a way to see what the previous value was. Then update the value of `selectedState` to the currently selected row.

2. In order to actually display the checkmark when a row is selected we need to redraw the cell. And since we want to also remove the checkmark from the previously selected row we'll need to draw that row also. The method `reloadRowsAtIndexPaths:withRowAnimation` does this nicely for us but we do need to build an array of `NSIndexPath` objects to pass to it.

3. It's possible the user has tabbed the same row that was already selected. In that case we only want to redraw one row. We check to see if the new index path is different from the old index path. Only if they are different do we add both to the array.

4. With all of our ducks in a row we simply call `[tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];`

Full code is below:

    - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        int previousSelection = selectedState;
        selectedState = indexPath.row;
    
        NSIndexPath *oldIndexPath = [NSIndexPath indexPathForRow:previousSelection inSection:0];
        NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:selectedState inSection:0];

        NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
        [indexPaths addObject:oldIndexPath];

        if (oldIndexPath.row != newIndexPath.row) {
            [indexPaths addObject:newIndexPath];
        }
    
        [tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    }

Comments, Feedback, Suggestions: [Michael Luton](mailto:mluton@gmail.com)

MIT license.
