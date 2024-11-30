using CheckInOutCGA.ViewModel;

namespace CheckInOutCGA.View;

public partial class VistaBothInicio : ContentView
{
	public VistaBothInicio()
	{
		InitializeComponent();
        BindingContext = new VistabothInicioViewModel(Navigation);
    }
}
