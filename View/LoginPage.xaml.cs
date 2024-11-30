using CheckInOutCGA.ViewModel;

namespace CheckInOutCGA.View;

public partial class LoginPage : ContentPage
{
	public LoginPage()
	{
		InitializeComponent();
        BindingContext = new LoginViewModel(Navigation);
    }
    async void TapGestureRecognizer_Tapped(System.Object sender, Microsoft.Maui.Controls.TappedEventArgs e)
    {
        bool answser = await DisplayAlert("Advertencia!", "¿Estas seguro de olvidar los datos registrados en el dispositivo?", "si", "no");
        if (answser)
        {
            Preferences.Remove("TOKEN");
            Preferences.Remove("LOGEADO");
            Preferences.Remove("PASSWORD");
        }
        else
        {

        }
    }
}
