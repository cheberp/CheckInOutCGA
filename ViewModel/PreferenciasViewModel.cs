using System;
using Newtonsoft.Json;
using System.Windows.Input;
using CheckInOutCGA.Model;
using System.Text;
using CheckInOutCGA.View;

namespace CheckInOutCGA.ViewModel
{
	public class PreferenciasViewModel:BaseViewModel
	{
        #region Variables
        string _anteriorcn="";
        string _nuevacn="";
        string _confirmarcn="";
        string _ocultarContrasena="";
        bool _usoHuella=false;
        #endregion
        #region Constructor
        public PreferenciasViewModel(INavigation navigation)
        {
            Navigation = navigation;
            IsPassword = true;
            OcultarContrasena = "hideb.png";
            Task lt=RequiereAut();
        }
        #endregion
        #region Objetos
        public string AnteriorCn
        {
            get { return _anteriorcn??""; }
            set { SetValue(ref _anteriorcn, value); }
        }
        public bool UsoHuella
        {
            get { return _usoHuella; }
            set { SetValue(ref _usoHuella, value); }
        }
        public string NuevaCn
        {
            get { return _nuevacn; }
            set { SetValue(ref _nuevacn, value); }
        }
        public string ConfirmarCn
        {
            get { return _confirmarcn; }
            set { SetValue(ref _confirmarcn, value); }
        }
        public string OcultarContrasena
        {
            get { return _ocultarContrasena; }
            set
            {
                SetValue(ref _ocultarContrasena, value);
            }
        }
        #endregion
        #region Procesos
        public async Task ActualizarContrasena()
        {
            int cia = Preferences.Get("CIA", 0);
            string usuario = Preferences.Get("USUARIO", string.Empty);
            LoginModel login = new LoginModel(usuario, NuevaCn, cia);
            Uri RequestUri = new Uri("http://cgyasc2014-001-site6.ctempurl.com/api/pass");
            HttpClient client = new HttpClient();
            var json = JsonConvert.SerializeObject(login);
            var contentJson = new StringContent(json, Encoding.UTF8, "application/json");
            var response = await client.PostAsync(RequestUri, contentJson);
            if (response.IsSuccessStatusCode)
            {
                await DisplayAlert("Información", "Se ha actualizado la contraseña correctamente", "ok");
                Preferences.Remove("PASSWORD");
                Preferences.Remove("LOGEADO");
                await Navigation.PushAsync(new LoginPage());
            }
            else
            {
                await DisplayAlert("Error", "No se pudo actualizar la contraseña", "ok");
            }
        }
        public void MostrarContrasena()
        {

            if (IsPassword)
            {
                IsPassword = false;
                OcultarContrasena = "visibleb.png";
            }
            else
            {
                IsPassword = true;
                OcultarContrasena = "hideb.png";
            }
        }
        public async Task ValidarCn()
        {
            if (NuevaCn == AnteriorCn)
            {
                await DisplayAlert("Error", "Ingrese una contraseña diferente", "ok");
            }
            else
            {
                string actual = Preferences.Get("PASSWORD", string.Empty);

                if (AnteriorCn == actual && NuevaCn == ConfirmarCn)
                {
                    await ActualizarContrasena();
                }
                else
                {
                    await DisplayAlert("Error", "Datos incorrectos al confirmar, intentelo de nuevo ", "ok");
                }
            }
        }
        public async Task CerrarSesion()
        {
            Preferences.Set("LOGEADO", false);
            await Navigation.PushAsync(new LoginPage());
            //await Navigation.PushAsync(new LoginPage());
        }
        public async Task RequiereAut()
        {
            var client = new HttpClient();
            int cia = Preferences.Get("CIA", 0);
            string uri = "http://cgyasc2014-001-site6.ctempurl.com/api/RequiereHuella?USUARIO=" + Preferences.Get("USUARIO",string.Empty) + "&APLICACION=" + Helpers.Settings.ObtenerAplicacion() + "&CIA=" + cia;
            var response = await client.GetStringAsync(uri);
            var resultado = JsonConvert.DeserializeObject<bool>(response);
            this.UsoHuella = resultado;
        }
        #endregion
        #region Comandos
        //public ICommand NombreAsyncommand => new Command(async () => await ValidarCn());
        public Command Vercontrasenacommand => new Command(MostrarContrasena);
        public Command Salircommand => new Command(async () => await CerrarSesion());
        public Command ValidarNuevaCncommand => new Command(async () => await ValidarCn());
        #endregion
    }
}

