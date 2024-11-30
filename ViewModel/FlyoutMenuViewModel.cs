using System;
using Newtonsoft.Json;

namespace CheckInOutCGA.ViewModel
{
	public class FlyoutMenuViewModel:BaseViewModel
	{
        #region Variables
        string _versionActual=string.Empty;
        string _nuevacn=string.Empty;   
        string _confirmarcn=string.Empty;
        string _ocultarContrasena=string.Empty;
        #endregion
        #region Constructor
        public FlyoutMenuViewModel(INavigation navigation)
        {
            Navigation = navigation;
            //IsPassword = true;
            VersionActual = VersionTracking.Default.CurrentVersion;

            //OcultarContrasena = "hideb.png";
        }
        #endregion
        #region Objetos
        public string VersionActual
        {
            get { return _versionActual??""; }
            set { SetValue(ref _versionActual, value); }
        }
        public string NuevaCn
        {
            get { return _nuevacn??""; }
            set { SetValue(ref _nuevacn, value); }
        }
        public string ConfirmarCn
        {
            get { return _confirmarcn??""; }
            set { SetValue(ref _confirmarcn, value); }
        }
        public string OcultarContrasena
        {
            get { return _ocultarContrasena??""; }
            set
            {
                SetValue(ref _ocultarContrasena, value);
            }
        }
        #endregion
        #region Procesos

        public void MostrarContrasena()
        {

            
        }
        public async Task ValidarCn()
        
        { //ojo aqui , no hacia nada
            await Task.Delay(1000); 
        }

        #endregion
        #region Comandos
        //public ICommand NombreAsyncommand => new Command(async () => await ValidarCn());
        public Command Vercontrasenacommand => new Command(MostrarContrasena);
        public Command ValidarNuevaCncommand => new Command(async () => await ValidarCn());
        #endregion
    }
}

