
using System.Windows.Input;

namespace CheckInOutCGA.ViewModel
{
	public class InicioViewModel:BaseViewModel
	{
        #region Variables
        int _Empleado=0;
        string _Nombre=string.Empty;
        string _Empresa=string.Empty;
        int _Cia=0;
        string _Turno=string.Empty;
        string _Horario=string.Empty;
        string _Supervisor= string.Empty;
        string _FotoEmpleado= string.Empty;
        string _LogoEmpresa=string.Empty;
        string _correo=string.Empty;

        #endregion
        #region Constructor
        public InicioViewModel(INavigation navigation)
        {
            Navigation = navigation;
            Title = "Inicio";
            Nombre = Preferences.Get("Nombre", string.Empty)??"";
            Empresa = Preferences.Get("Nombre_CIA", string.Empty)??"";
            _Cia = Preferences.Get("CIA", 0);
            Empleado = Preferences.Get("EMPLEADO", 0);
            Turno = Preferences.Get("Turno", string.Empty)??"";
            Horario = Preferences.Get("Horario", string.Empty)??"";
            Supervisor = Preferences.Get("Supervisor", string.Empty)??"";
            Correo = Preferences.Get("CORREO", string.Empty)??"a@mail.com";
            FotoEmpleado = "http://cgyasc2014-001-site1.ctempurl.com/cia" + _Cia + "/fotos/" + _Empleado + ".jpg"??"";
            LogoEmpresa = "http://cgyasc2014-001-site1.ctempurl.com/cia" + _Cia + "/logo.jpg"??"";
        }
        #endregion
        #region Objetos
        public int Empleado
        {
            get { return _Empleado; }
            set { SetValue(ref _Empleado, value); }
        }
        public string Nombre
        {
            get { return _Nombre??""; }
            set { SetValue(ref _Nombre, value); }
        }
        public string Empresa
        {
            get { return _Empresa; }
            set { SetValue(ref _Empresa, value); }
        }
        public string Turno
        {
            get { return _Turno??""; }
            set { SetValue(ref _Turno, value); }
        }

        public string Horario
        {
            get { return _Horario??""; }
            set { SetValue(ref _Horario, value); }
        }
        public string Supervisor
        {
            get { return _Supervisor??""; }
            set { SetValue(ref _Supervisor, value); }
        }
        public string FotoEmpleado
        {
            get { return _FotoEmpleado; }
            set { SetValue(ref _FotoEmpleado, value); }
        }
        public string LogoEmpresa
        {
            get { return _LogoEmpresa; }
            set { SetValue(ref _LogoEmpresa, value); }
        }
        public string Correo
        {
            get { return _correo??"a@mail.com"; }
            set { SetValue(ref _correo, value); }
        }
        #endregion
        #region Procesos
        //public async Task Prueba()
        //{

        //}
        public void MostrarContrasena()
        {

        }
        #endregion
        #region Comandos
        //public ICommand Asynccommand => new Command(async () => await Prueba());
        //public ICommand Restablecercommand => new Command(async () => await RestablecerContrasena());
        public ICommand Metodcommand => new Command(MostrarContrasena);
        #endregion
    }
}

