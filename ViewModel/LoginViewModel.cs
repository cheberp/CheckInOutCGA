using System;
using System.Text;
using System.Windows.Input;
using CheckInOutCGA.Model;
using CheckInOutCGA.View;
using Microsoft.Maui.Controls;
using Newtonsoft.Json;
using Plugin.Fingerprint;
using Plugin.Fingerprint.Abstractions;

namespace CheckInOutCGA.ViewModel
{
    public class LoginViewModel : BaseViewModel
    {
        #region Variables
        string _Usuario=string.Empty;
        string _Password=string.Empty;
        string _ocultarContrasena=string.Empty;
        string _marca=string.Empty;
        string _modelo=string.Empty;
        public NombreModel Nombre = new NombreModel();
        #endregion
        #region Constructor
        public LoginViewModel(INavigation navigation)
        {
            Navigation = navigation;
            IsPassword = true;
            OcultarContrasena = "hideb.png";
            Modelo = DeviceInfo.Model;
            Marca = DeviceInfo.Manufacturer;
            //NombreDispositivo= DeviceInfo.Name;
            string tipoDispositivo = DeviceInfo.DeviceType.ToString();
            Usuario = String.Empty;
            Password = string.Empty; 
            IsEnable = false; 
            IsBusy = false; 


            if (Preferences.ContainsKey("LOGEADO"))
            {
                bool logeado = Preferences.Get("LOGEADO", false);
                if (logeado)
                {
                    Password = Preferences.Get("PASSWORD", string.Empty);
                    Usuario = Preferences.Get("USUARIO", string.Empty);
                    IsEnable = false;
                    Task lg = Login();
                }
                Password = Preferences.Get("PASSWORD", string.Empty);
                Usuario = Preferences.Get("USUARIO", string.Empty);
                IsEnable = true;
            }
            else
            {

                if (tipoDispositivo != "Physical")
                {
                    /*CODIGO SOLO PARA PRUEBAS CON EMULADORES*/
                    IsEnable = true;
                    if (Preferences.Get("LOGEADO", false))
                    {
                        Password = Preferences.Get("PASSWORD", string.Empty);
                        Usuario = Preferences.Get("USUARIO", string.Empty);
                        IsEnable = false;
                        Task lg = Login();
                    }
                    Password = Preferences.Get("PASSWORD", string.Empty);
                    Usuario = Preferences.Get("USUARIO", string.Empty);
                    //IsEnable = false;
                    Task ale = DisplayAlert("Atencion", "Dispositivo Virtual no olvide cerrar su sesion al finalizar", "ok");

                }
                else
                {
                    if (Preferences.ContainsKey("USUARIO") && Preferences.ContainsKey("PASSWORD"))
                    {
                        IsEnable = false;
                        //IsBusy = true;
                        Task lgn = Login();
                    }
                }
            }
            IsBusy = false;
            //IsEnable = true;
        }
        #endregion
        #region Objetos
        public string Usuario
        {
            get { return _Usuario ?? "Requerido"; }
            set { SetValue(ref _Usuario, value); }
        }
        public string Password
        {
            get { return _Password ?? "Requerido"; }
            set { SetValue(ref _Password, value); }
        }
        public string OcultarContrasena
        {
            get { return _ocultarContrasena ?? "??"; }
            set { SetValue(ref _ocultarContrasena, value); }
        }
        public string Marca
        {
            get { return _marca ?? ""; }
            set { SetValue(ref _marca, value); }
        }
        public string Modelo
        {
            get { return _modelo ?? ""; }
            set { SetValue(ref _modelo, value); }
        }
        #endregion
        #region Procesos
        public async Task Login()
        {
            if (VersionTracking.Default.IsFirstLaunchForVersion(VersionTracking.Default.CurrentVersion) && VersionTracking.Default.PreviousVersion != null && VersionTracking.Default.CurrentVersion != VersionTracking.Default.PreviousVersion)
            {
                await ActualizarTK();
            }
            string _token = Preferences.Get("TOKEN", string.Empty);
            string Mensaje = "";
            LoginModel login = new LoginModel(Usuario, Password, Modelo, Marca, _token, Helpers.Settings.ObtenerAplicacion());
            try
            {
                IsBusy = true;
                IsEnable = false;
                Uri RequestUri = new Uri("http://cgyasc2014-001-site6.ctempurl.com/api/usertk");
                // Uri RequestUri = new Uri("http://localhost:63538//api/usertk");
                HttpClient client = new HttpClient();
                var json = JsonConvert.SerializeObject(login);
                var contentJson = new StringContent(json, Encoding.UTF8, "application/json");
                var response = await client.PostAsync(RequestUri, contentJson);
                if (response.IsSuccessStatusCode)
                {
                    //string content = await response.Content.ReadAsStreamAsync();
                    var content = await response.Content.ReadAsStringAsync();
                    var obj = JsonConvert.DeserializeObject<NombreModel>(content);
                    if (obj != null)
                    {
                        Preferences.Set("Nombre", obj.NOMBRE);
                        Preferences.Set("Nombre_CIA", obj.NOMBRE_CIA);
                        Preferences.Set("CIA", obj.CIA);
                        Preferences.Set("EMPLEADO", obj.EMPLEADO);
                        Preferences.Set("Turno", obj.TURNO);
                        Preferences.Set("Horario", obj.HORARIO);
                        Preferences.Set("Supervisor", obj.SUPERVISOR);
                        Preferences.Set("LOGEADO", true);
                        Preferences.Set("TOKEN", obj.TOKEN);
                        Preferences.Set("CORREO", obj.CORREO);
                        Preferences.Set("REQUIERE_AUT", obj.REQUIERE_AUT);
                        //Preferences.Set("PASSWORD", Password);
                        //Preferences.Set("USUARIO", Usuario);
                        VerificarEstadoHuella();
                        //Preferences.Set("Nombre_CIA", obj.TOKEN);
                        //IsBusy = false;
                        //IsEnable = true;
                    }
                }
                else
                {

                    var content = await response.Content.ReadAsStringAsync();
                    var obj = JsonConvert.DeserializeObject<Dictionary<string, string>>(content);
                    if (obj != null)
                        Mensaje = obj["Message"] ?? "";
                    await DisplayAlert("Upps..", Mensaje, "Aceptar");
                    IsEnable = true;
                    IsBusy = false;
                }
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", ex.Message, "Continuar");
            }
        }
        public async Task ActualizarTK()
        {
            int cia = Preferences.Get("CIA", 0);
            string tk = Preferences.Get("TOKEN", string.Empty);
            LoginModel aToken = new LoginModel(Usuario, cia, tk);
            Uri RequestUri = new Uri("http://cgyasc2014-001-site6.ctempurl.com/api/ActualizacionToken/");
            HttpClient client = new HttpClient();
            var json = JsonConvert.SerializeObject(aToken);
            var contentJson = new StringContent(json, Encoding.UTF8, "application/json");
            var response = await client.PostAsync(RequestUri, contentJson);
            if (response.IsSuccessStatusCode)
            {
                var content = await response.Content.ReadAsStringAsync();
                await DisplayAlert("Información", "Se ha actualizado el Token correctamente", "ok");
                Preferences.Remove("TOKEN");
                string tktemp = content.ToString().Substring(1, content.Length - 2);
                Preferences.Set("TOKEN", tktemp);

            }
            else
            {
                await DisplayAlert("Error", "No se pudo actualizar correctamente el Token del dispositivo, solicite ayuda para desvincular el dispositivo", "ok");
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
        public async void VerificarEstadoHuella()
        {
            //Verificar si tiene iniciar sesion con huella
            var client = new HttpClient();
            int cia = Preferences.Get("CIA", 0);
            string uri = "http://cgyasc2014-001-site6.ctempurl.com/api/RequiereHuella?USUARIO=" + Usuario + "&APLICACION=" + Helpers.Settings.ObtenerAplicacion() + "&CIA=" + cia;
            var response = await client.GetStringAsync(uri);
            var resultado = JsonConvert.DeserializeObject<bool>(response);
            //bool resultado = true;
            //Verificar si el dispositivo tiene para huella
            bool isAva = await CrossFingerprint.Current.IsAvailableAsync(true);

            if (resultado && isAva)
            {
                var _conf = new AuthenticationRequestConfiguration("Autenticación", "Ingrese su huella");
                var res = await CrossFingerprint.Current.AuthenticateAsync(_conf);
                if (res.Authenticated)
                {
                    //sucess!!!!!
                    VerificarDispositivo();
                }
                else
                {
                    //wrong
                    await DisplayAlert("Error", "Huella no reconocida", "Ok");
                    IsBusy = false;
                }
            }
            else
            {
                //await DisplayAlert("alert", "No se encontró autenticación por huella", "ok");
                VerificarDispositivo();
            }

        }
        public async void VerificarDispositivo()
        {
            try
            {

                var client = new HttpClient();

                string uri = "http://cgyasc2014-001-site6.ctempurl.com/api/user?usuario=" + Usuario + "&MARCA=" + Marca + "&MODELO=" + Modelo/*+"&NOMBREDISPOSITVO="+NombreDispositivo*/;
                var response = await client.GetStringAsync(uri);
                var resultado = JsonConvert.DeserializeObject<bool>(response);
                if (resultado)
                {

                    Preferences.Set("USUARIO", Usuario);
                    Preferences.Set("PASSWORD", Password);
                    //Pagina a la cual contenga el menu flyout o tabbed
                    await Navigation.PushAsync(new Flyoutpage());
                    //await Navigation.PushAsync(new NavigationPage(new PrincipalPage()));
                }
                else
                {
                    await DisplayAlert("Error", "El usuario no tiene registrado este dispositivo", "Ok");
                }
                IsEnable = true;
                IsBusy = false;
            }
            catch (Exception ex)
            {
                IsEnable = true;
                IsBusy = false;
                await DisplayAlert("Error:", ex.ToString(), "OK");
            }
        }
        #endregion
        #region Comandos
        public ICommand Logincommand => new Command(async () => await Login());
        //public ICommand Restablecercommand => new Command(async () => await RestablecerContrasena());
        public ICommand Vercontrasenacommand => new Command(MostrarContrasena);
        #endregion
    }
}

