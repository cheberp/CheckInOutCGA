using CheckInOutCGA.ViewModel;

namespace CheckInOutCGA.View;

public partial class InicioPage : ContentPage
{
	public InicioPage()
	{
		InitializeComponent();
		BindingContext = new InicioViewModel(Navigation);
	}
}
