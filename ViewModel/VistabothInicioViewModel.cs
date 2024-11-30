using System;
using System.Windows.Input;

namespace CheckInOutCGA.ViewModel
{
	public class VistabothInicioViewModel:BaseViewModel
	{
        #region Variables
        string _Version="";
        string _PreviaVersion="";

        #endregion
        #region Constructor
        public VistabothInicioViewModel(INavigation navigation)
        {
            Navigation = navigation;
            if (Helpers.Settings.Obtenerversion() == "")
            {
                Preferences.Set("VERSION_ACTUAL", VersionTracking.Default.CurrentVersion);
            }
            Version = VersionTracking.Default.CurrentVersion;

        }
        #endregion
        #region Objetos
        public string Version
        {
            get { return _Version??""; }
            set { SetValue(ref _Version, value); }
        }
        public string PreviaVersion
        {
            get { return _PreviaVersion??""; }
            set { SetValue(ref _PreviaVersion, value); }
        }
        #endregion
        #region Procesos
        //public async Task Prueba()
        //{

        //}
        public async Task VerificaVersion()
        {
            if (VersionTracking.Default.IsFirstLaunchEver)
            {
                await DisplayAlert("Actualizacion", "Bienvenido a la aplicacion de Recibos Electronicos de CGA", "Gracias");
            }
            else
            {
                if (VersionTracking.Default.IsFirstLaunchForCurrentVersion)
                {

                }
            }
        }
        #endregion
        #region Comandos
        //public ICommand Asynccommand => new Command(async () => await Prueba());
        //public ICommand Restablecercommand => new Command(async () => await RestablecerContrasena());
        public ICommand Metodcommand => new Command(async () => await VerificaVersion());
        #endregion
    }
}

