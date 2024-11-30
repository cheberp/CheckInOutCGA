using CheckInOutCGA.ViewModel;
using Microsoft.Maui.Maps;

namespace CheckInOutCGA.View;

public partial class Checador : ContentPage
{
    //ChecadorViewModel VistaPrincipalDetalle;
    
    public Checador()
    {
        InitializeComponent();
       
        
        if (Navigation == null)
        {
            throw new InvalidOperationException("Navigation no está inicializado.");
        }

        BindingContext = new ChecadorViewModel(Navigation);
    }
    public async void UbicarMapa()
    {
       // VistaPrincipalDetalle.Longitud = 0.0;
       // VistaPrincipalDetalle.Latitude = 0.0;
        try
        {
            var request = new GeolocationRequest(GeolocationAccuracy.High);

            //var location = await Geolocation.GetLocationAsync(request);
            var location = await Geolocation.GetLocationAsync(request) ?? new Location(0, 0);
            Location lc = location;
            if (lc == null)
            {
                //await DisplayAlert("alert", "No se detecto una Ubicación", "ok");
            }
            {
                if (lc != null)
                {
                    if (lc.IsFromMockProvider)
                    {

                    }
                    else
                    {
                       // VistaPrincipalDetalle.Longitud = lc.Longitude;
                        //VistaPrincipalDetalle.Latitude = lc.Latitude;
                        //MapSpan Ubi = MapSpan.FromCenterAndRadius(new Position(VistaPrincipalDetalle.Latitude, VistaPrincipalDetalle.Longitud), Distance.FromMeters(100));
                        MapSpan Ubi = MapSpan.FromCenterAndRadius(new Location(lc.Latitude, lc.Longitude), Distance.FromMeters(100));
                       // MapaPosicion.MoveToRegion(Ubi);
                    }
                }
            }
        }
        catch
        {

        }
    }
}
