using CheckInOutCGA.ViewModel;

namespace CheckInOutCGA.View;

public partial class TiemposPage : ContentPage
{
	public TiemposPage()
	{
		InitializeComponent();
		BindingContext = new TiemposViewModel(Navigation);
	}
}
