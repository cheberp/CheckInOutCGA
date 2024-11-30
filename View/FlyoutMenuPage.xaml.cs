using CheckInOutCGA.ViewModel;

namespace CheckInOutCGA.View;

public partial class FlyoutMenuPage : ContentPage
{
	public FlyoutMenuPage()
	{
		InitializeComponent();
		BindingContext = new FlyoutMenuViewModel(Navigation);
	}
}
