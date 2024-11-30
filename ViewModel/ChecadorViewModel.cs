using Newtonsoft.Json;
using System.Windows.Input;
using CheckInOutCGA.Model;
using System.Text;
using Plugin.Maui.Audio;

namespace CheckInOutCGA.ViewModel
{
    public class ChecadorViewModel : BaseViewModel
    {
        #region Variables
        string _Nombre = string.Empty;
        DateTime _dateTime = DateTime.Now;
        double _latitud = 0;
        double _longitud = 0;
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
        //private readonly IAudioManager audioManager;
        List<ChecadasSemanaModel> _checadasSemana = new List<ChecadasSemanaModel>();
        #endregion
        #region Constructor
        public ChecadorViewModel(INavigation navigation)
        {
            Navigation = navigation;
            Nombre = Preferences.Get("Nombre", string.Empty);
            EmpresaNombre = Preferences.Get("Nombre_CIA", string.Empty);
            Empleado = Preferences.Get("EMPLEADO", 0);
            this.DateTime = DateTime.Now;
            var dispatcher = Dispatcher.GetForCurrentThread();
            if (dispatcher != null)
            {
                var timer = dispatcher.CreateTimer(); 
                //var timer = Application.Current.Dispatcher.CreateTimer(); //ojo se cambio
                timer.Interval = TimeSpan.FromSeconds(1);
                timer.Tick += (s, e) => Hora();
                timer.Start();
                // Configura el timer aquí
            }

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
            get { return _Nombre ?? ""; }
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
            ObtenerUbicacion();
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
                var contentJson = new StringContent(json, System.Text.Encoding.UTF8, "application/json");
                var response = await client.PostAsync(RequestUri, contentJson);
                if (response.IsSuccessStatusCode)
                {
                    SoundChecada(true);
                    var content = await response.Content.ReadAsStringAsync();
                    //string content = await response.Content.ReadAsStreamAsync();
                    var obj = JsonConvert.DeserializeObject<List<ChecadasSemanaModel>>(content);
                    IsBusy = false;
                    IsEnable = true;
                    string UbicacionChecada = ChecadasSemana?.FirstOrDefault()?.UBICACION ?? "Desconocida";
                    if (UbicacionChecada == "Desconocida")
                    {
                        await DisplayAlert("Checada fuera de Area", Nombre + " has checado el dia " + DateTime.ToString("dd/MM/yyyy") + " a las " + DateTime.ToString("HH:mm:ss") + " hrs.", "Aceptar");
                    }
                    else
                    {
                        await DisplayAlert("Checada ", Nombre + " has checado el dia " + DateTime.ToString("dd/MM/yyyy") + " a las " + DateTime.ToString("HH:mm:ss") + " hrs.", "Aceptar");
                    }
                    if (obj != null)
                    {
                        ChecadasSemana = obj.ToList();
                    }
                    //Clima();
                }
                else
                {
                    SoundChecada(false);
                    string content = response.RequestMessage?.Content?.ToString() ?? "Contenido de la respuesta no disponible";
                    await DisplayAlert("Checada Incorrecta", content, "Continuar");
                    //await DisplayAlert("Checada Incorrecta",response.RequestMessage.Content.ToString(), "Continuar");
                }
            }
            catch (Exception ex)
            {
                IsBusy = false;
                IsEnable = true;
                SoundChecada(false);
                await DisplayAlert("Error", ex.Message, "Continuar");
            }
            MuestraMapa = true;
            MuestraChecadas = true;
        }
        public async void SoundChecada(bool valida)
        {

            string audio = "";
            if (valida)
            {
                audio = "success.mp3";
            }
            else
            {
                audio = "fail.mp3";
            }
            AudioManager am = new AudioManager();
            var player = am.CreatePlayer(await FileSystem.OpenAppPackageFileAsync(audio));
            player.Play();
            //player.Dispose();

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
                        //if (lc.IsFromMockProvider)
                        //{
                        //    IsEnable = false;
                        //    await DisplayAlert("alert", "Mock Location", "ok");
                        //}
                        //else
                        //{
                        Latitude = lc.Latitude;
                        Longitud = lc.Longitude;
                        //}
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
                var JsonResult = await response.Content.ReadAsStringAsync();
                var resultado = JsonConvert.DeserializeObject<WeatherModel>(JsonResult);
                if (resultado != null)
                {
                    MuestraClima = resultado;
                }
            }
            catch
            {
                await DisplayAlert("Información", "Clima no disponible", "Ok");
            }


        }
        void Hora()
        {
            MainThread.BeginInvokeOnMainThread(() =>
            {
                this.DateTime = DateTime.Now;
            });
        }
        #endregion
        #region Comandos
        //public ICommand NombreAsyncommand => new Command(async () => await ProcesoAsyncrono());
        //public ICommand Nombrecommand => new Command(ProcesoSimple);
        #endregion
        public ICommand ChecarCommand => new Command(async () => await Checar());
    }
}

