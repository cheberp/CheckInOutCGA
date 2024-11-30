using System.Text;
using CheckInOutCGA.Model;
using CheckInOutCGA.ViewModel;
using Newtonsoft.Json;

namespace CheckInOutCGA.View;

public partial class PreferenciasPage : ContentPage
{
    bool loaded;
    public PreferenciasPage()
    {
        InitializeComponent();
        BindingContext = new PreferenciasViewModel(Navigation);
    }
    protected override void OnAppearing()
    {
        base.OnAppearing();
        loaded = true;
    }
    private void rbtnSystem_CheckedChanged(object sender, CheckedChangedEventArgs e)
    {
        if (!loaded)
            return;
        if (!e.Value)
            return;
        var val = (sender as RadioButton)?.Value as string;
        if (string.IsNullOrWhiteSpace(val))
            return;
        switch (val)
        {
            case "System":
                Helpers.Settings.Theme = 0;
                Image image = new Image();
                image.SetAppTheme<FileImageSource>(Image.SourceProperty, "lightlogo.png", "darklogo.png");
                break;
            case "Light":
                Helpers.Settings.Theme = 1;
                break;
            case "Dark":
                Helpers.Settings.Theme = 2;
                break;
        }
        Helpers.Theme.SetTheme();
    }

    async void Switch_ToggledAsync(System.Object sender, Microsoft.Maui.Controls.ToggledEventArgs e)
    {
        int cia = Preferences.Get("CIA", 0);
        string usuario = Preferences.Get("USUARIO", string.Empty);
        string tk = Preferences.Get("TOKEN", string.Empty);
        RequiereHuellaModel rHuella = new RequiereHuellaModel(usuario,Helpers.Settings.ObtenerAplicacion(),tk, e.Value, cia);
        Uri RequestUri = new Uri("http://cgyasc2014-001-site6.ctempurl.com/api/RequiereHuella");
        HttpClient client = new HttpClient();
        var json = JsonConvert.SerializeObject(rHuella);
        var contentJson = new StringContent(json, Encoding.UTF8, "application/json");
        var response = await client.PostAsync(RequestUri, contentJson);
        //if (response.IsSuccessStatusCode)
        //{
        //    //await DisplayAlert("Información", "Se ha actualizado la configuración para el incio de sesión", "ok");
 
        //}
        //else
        //{
        //    await DisplayAlert("Error", "No se pudo actualizar la configuración", "ok");
        //}
    }

}
