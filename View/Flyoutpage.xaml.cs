using CheckInOutCGA.Model;

namespace CheckInOutCGA.View;

public partial class Flyoutpage : FlyoutPage
{
	public Flyoutpage()
	{
		InitializeComponent();
        flyoutPage.collectionView.SelectionChanged += CollectionView_SelectionChanged;
	}

    private void CollectionView_SelectionChanged(object? sender, SelectionChangedEventArgs e)
    {
       /* var item = e.CurrentSelection.FirstOrDefault() as FlyoutPageItemModel;
        if (item != null)
        {
            Detail = new NavigationPage((Page)Activator.CreateInstance(item.TargetType));
            if (!((IFlyoutPageController)this).ShouldShowSplitMode)
                IsPresented = false;
        }*/
        if (e.CurrentSelection.FirstOrDefault() is FlyoutPageItemModel item)
    {
        Detail = new NavigationPage((Page?)Activator.CreateInstance(item.TargetType));
        if (!((IFlyoutPageController)this).ShouldShowSplitMode)
        {
            IsPresented = false;
        }
    }

    }
}
