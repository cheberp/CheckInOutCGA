using System;
using Newtonsoft.Json;
using System.Windows.Input;
using CheckInOutCGA.Model;
using System.Text;
using CheckInOutCGA.View;

namespace CheckInOutCGA.ViewModel
{
	public class ReportesViewModel:BaseViewModel
	{
        #region Variables
        string _anteriorcn=string.Empty;
        string _nuevacn=string.Empty;
        string _confirmarcn=string.Empty;
        string _ocultarContrasena=string.Empty;
        #endregion
        #region Constructor
        public ReportesViewModel(INavigation navigation)
        {
            Navigation = navigation;
            
        }
        #endregion
        #region Objetos
        public string AnteriorCn
        {
            get { return _anteriorcn; }
            set { SetValue(ref _anteriorcn, value); }
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
            set { SetValue(ref _ocultarContrasena, value); }
        }
        #endregion
        #region Procesos
        public async Task CargaPeriodos()
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
                OcultarContrasena = "Ver.png";
            }
            else
            {
                IsPassword = true;
                OcultarContrasena = "Ocultar.png";
            }
        }
        public async Task ValidarCn()
        {
            //ojo aqui , no hacia nada
            await Task.Delay(1000); 
            Console.WriteLine("Validación completada.");
        }
        #endregion
        #region Comandos
        //public ICommand NombreAsyncommand => new Command(async () => await ValidarCn());
        public ICommand Vercontrasenacommand => new Command(MostrarContrasena);
        public ICommand ValidarNuevaCncommand => new Command(async () => await ValidarCn());
        #endregion
    }
}

