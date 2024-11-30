using Newtonsoft.Json;
using System.Windows.Input;
using CheckInOutCGA.Model;
using System.Text;

namespace CheckInOutCGA.ViewModel
{
    public class PrincipalViewModel : BaseViewModel
    {
        #region Variables
        string _Nombre = string.Empty;
        DateTime _dateTime = DateTime.Now;
        double _latitud = 0;
        double _longitud;
        string _empresaNombre = string.Empty;
        int _empleado = 0;
        bool _muestraMapa;
        bool _muestraChecadas;
        string _lcEncontrada = string.Empty;

        WeatherModel _muestraClima = new WeatherModel
        {
            count = "1", // Inicializa con valores específicos
            data = new WeatherModel.Datum[]
            {
        new WeatherModel.Datum
        {
            city_name = "Ciudad ejemplo",
            temp = 25.5f
        }
            }
        };
        //WeatherModel _muestraClima;

        List<ChecadasSemanaModel> _checadasSemana = new List<ChecadasSemanaModel>();
        #endregion
        #region Constructor
        public PrincipalViewModel(INavigation navigation)
        {
            Navigation = navigation;
            Nombre = Preferences.Get("NombreText", string.Empty);
            EmpresaNombre = Preferences.Get("Nombre_CIA", string.Empty);
            Empleado = Preferences.Get("EMPLEADO", 0);
            this.DateTime = DateTime.Now;
            ObtenerUbicacion();
        }
        #endregion
        #region Objetos
        public string LcEncontrada
        {
            get { return _lcEncontrada; }
            set { SetValue(ref _lcEncontrada, value); }
        }
        public string Nombre
        {
            get { return _Nombre; }
            set { SetValue(ref _Nombre, value); }
        }
        public string EmpresaNombre
        {
            get { return _empresaNombre; }
            set { SetValue(ref _empresaNombre, value); }
        }
        public int Empleado
        {
            get { return _empleado; }
            set { SetValue(ref _empleado, value); }
        }

        public DateTime DateTime
        {
            get { return _dateTime; }
            set
            {
                if (value != _dateTime)
                    _dateTime = value;
                OnpropertyChanged("DateTime");
            }
        }
        public double Latitude
        {
            get { return _latitud; }
            set { SetValue(ref _latitud, value); }
        }
        public double Longitud
        {
            get { return _longitud; }
            set { SetValue(ref _longitud, value); }
        }
        public bool MuestraMapa
        {
            get { return _muestraMapa; }
            set { SetValue(ref _muestraMapa, value); }
        }
        public bool MuestraChecadas
        {
            get { return _muestraChecadas; }
            set { SetValue(ref _muestraChecadas, value); }
        }
        public List<ChecadasSemanaModel> ChecadasSemana
        {
            get { return _checadasSemana; }
            set { SetValue(ref _checadasSemana, value); }
        }
        public WeatherModel MuestraClima
        {
            get { return _muestraClima; }
            set
            {
                SetValue(ref _muestraClima, value);
                OnpropertyChanged();
            }
        }
        #endregion
        #region Procesos
        public async Task Checar()
        {
            ChecadaModel checada = new ChecadaModel
            {
                CIA = Preferences.Get("CIA", 0),
                EMPLEADO = Empleado,
                LATITUD = Latitude,
                LONGITUD = Longitud
            };
            try
            {
                IsBusy = true;
                IsEnable = false;
                Uri RequestUri = new Uri("http://cgyasc2014-001-site6.ctempurl.com/api/terminal");
                HttpClient client = new HttpClient();
                var json = JsonConvert.SerializeObject(checada);
                var contentJson = new StringContent(json, Encoding.UTF8, "application/json");
                var response = await client.PostAsync(RequestUri, contentJson);
                if (response.IsSuccessStatusCode)
                {
                    var content = await response.Content.ReadAsStringAsync();
                    //string content = await response.Content.ReadAsStreamAsync();
                    var obj = JsonConvert.DeserializeObject<List<ChecadasSemanaModel>>(content);
                    if (obj != null)
                    {
                        ChecadasSemana = obj;
                        IsBusy = false;
                        IsEnable = true;
                        Clima();
                    }
                    else
                    {
                        //await DisplayAlert("")
                    }
                }
            }
            catch (Exception ex)
            {
                IsBusy = false;
                IsEnable = true;
                await DisplayAlert("Error", ex.Message, "Continuar");
            }
            await DisplayAlert("Checada", Nombre + " has checado el dia " + DateTime.ToString("dd/MM/yyyy") + " a las " + DateTime.ToString("HH:mm:ss") + " hrs.", "Aceptar");
            MuestraMapa = true;
            MuestraChecadas = true;
        }
        public async void ObtenerUbicacion()
        {
            try
            {
                var request = new GeolocationRequest(GeolocationAccuracy.High);
                //var location = await Geolocation.GetLocationAsync(request);
                var location = await Geolocation.GetLocationAsync(request) ?? new Location(0, 0);
                Location lc = location;
                if (lc == null)
                {
                    LcEncontrada = "No se detecto una geolocalización";
                }
                {
                    if (lc != null)
                    {
                        if (lc.IsFromMockProvider)
                        {
                            IsEnable = false;
                            await DisplayAlert("alert", "Mock Location", "ok");
                        }
                        else
                        {
                            Latitude = lc.Latitude;
                            Longitud = lc.Longitude;
                            if (Preferences.Get("LOGEADO", false))
                            {
                                await DisplayAlert("Bienvenido:", Nombre, "Ok");
                            }
                        }
                    }
                }


            }
            catch
            {
                await DisplayAlert("Error", "La ubicacion no se encuentra encendida", "Ok");
                //Navigation.PushAsync(new InicioSesion());
                IsEnable = false;
            }
        }
        public async void Clima()
        {
            var client = new HttpClient();
            string uri = "https://api.weatherbit.io/v2.0/current?lat=" + Latitude.ToString() + "&lon=" + Longitud.ToString() + "&lang=es&Key=77bc2c3f140848beaeffd9356b283a9c";

            try
            {
                var response = await client.GetAsync(uri);
                response.EnsureSuccessStatusCode();

                var jsonResult = await response.Content.ReadAsStringAsync();

                var resultado = JsonConvert.DeserializeObject<WeatherModel>(jsonResult);

                if (resultado != null)
                {
                    MuestraClima = resultado;
                }
                else
                {
                    // Maneja el caso donde el resultado es null
                    throw new InvalidOperationException("datos no válidos para deserializar.");
                }
            }
            catch
            {
                await DisplayAlert("Información", "Clima no disponible", "Ok");
            }


        }
        #endregion
        #region Comandos
        //public ICommand NombreAsyncommand => new Command(async () => await ProcesoAsyncrono());
        //public ICommand Nombrecommand => new Command(ProcesoSimple);
        #endregion
        public ICommand ChecarCommand => new Command(async () => await Checar());
    }
}

