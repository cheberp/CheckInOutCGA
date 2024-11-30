using Newtonsoft.Json;
using System.Windows.Input;
using CheckInOutCGA.Model;

namespace CheckInOutCGA.ViewModel
{
    public class TiemposViewModel : BaseViewModel
    {
        #region Variables
        string _Texto = "";
        string _periodo = "";
        List<TiemposModel> _tiempos=new List<TiemposModel>();
        string _Nombre=string.Empty;
        #endregion
        #region Constructor
        public TiemposViewModel(INavigation navigation)
        {
            Navigation = navigation;
            Nombre = Preferences.Get("Nombre", string.Empty);
        }
        #endregion
        #region Objetos
        public string Texto
        {
            get { return _Texto ?? ""; }
            set { SetValue(ref _Texto, value); }
        }
        public string Nombre
        {
            get { return _Nombre ?? ""; }
            set { SetValue(ref _Nombre, value); }
        }
        public List<TiemposModel> Tiempos
        {
            get { return _tiempos; }
            set { SetValue(ref _tiempos, value); }
        }
        public string Periodo
        {
            get { return _periodo; }
            set { SetValue(ref _periodo, value); }
        }
        #endregion
        #region Procesos
        public async Task CalculaTiempos()
        {
            IsBusy = true;
            IsEnable = false;
            try
            {
                //string token = Preferences.Get("JWT", string.Empty);
                int cia = Preferences.Get("CIA", 0);
                int empleado = Preferences.Get("EMPLEADO", 0);
                var client = new HttpClient();
                //client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
                string uri = "http://cgyasc2014-001-site6.ctempurl.com/api/tiempos?CIA=" + cia.ToString() + "&EMPLEADO=" + empleado.ToString();
                var response = await client.GetStringAsync(uri);
                var resultado = JsonConvert.DeserializeObject<List<TiemposModel>>(response);
                if (resultado != null)
                {

                    Tiempos = resultado;

                    if (resultado[0].PERIODO != null)
                    {
                        Periodo = resultado[0].PERIODO;
                    }
                    else
                    {
                        Periodo = "";
                    }
                }
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error:", ex.ToString(), "OK");
            }
            IsBusy = false;
            IsEnable = true;
        }
        public void ProcesoSimple()
        {

        }
        #endregion
        #region Comandos
        public ICommand CalculaTiemposCommand => new Command(async () => await CalculaTiempos());
        public ICommand Nombrecommand => new Command(ProcesoSimple);
        #endregion
    }
}

