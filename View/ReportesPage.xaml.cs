using CheckInOutCGA.ViewModel;

namespace CheckInOutCGA.View;

public partial class ReportesPage : ContentPage
{
	public ReportesPage()
	{
		InitializeComponent();
		BindingContext = new ReportesViewModel(Navigation);
	}
}
