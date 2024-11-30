namespace CheckInOutCGA.View;

public partial class VistaHeaderPreferencias : ContentView
{
	public VistaHeaderPreferencias()
	{
		InitializeComponent();
	}
    void TapGestureRecognizer_Tapped(System.Object sender, Microsoft.Maui.Controls.TappedEventArgs e)
    {
        Navigation.PopAsync();
        //Navigation.PopAsync();
        //Navigation.PushAsync(new LoginPage());
    }
}
