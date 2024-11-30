namespace CheckInOutCGA.View;

public partial class VistaHeader : ContentView
{
	public VistaHeader()
	{
		InitializeComponent();
		
	}

    void IrAjustes(System.Object sender, System.EventArgs e)
    {
        //Navigation.PopAsync();
        Navigation.PushAsync(new PreferenciasPage());
    }
}
