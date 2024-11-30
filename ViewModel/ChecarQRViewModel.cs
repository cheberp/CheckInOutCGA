using System;
using Newtonsoft.Json;
using System.Windows.Input;

namespace CheckInOutCGA.ViewModel
{
	public class ChecarQRViewModel:BaseViewModel
	{
        #region Variables
        string _lecturaQR=string.Empty;
        DateTime _dateTime=DateTime.Now;
        //IDispatcherTimer timer;
        #endregion
        #region Constructor
        //[Obsolete]
        public ChecarQRViewModel(INavigation navigation)
        {
            Navigation = navigation;
            this.DateTime = DateTime.Now;
            //Device.StartTimer(TimeSpan.FromSeconds(1), () =>
            //{
            //    this.DateTime = DateTime.Now;
            //    return true;
            //});

        }
        #endregion
        #region Objetos
        public string LecturaQR
        {
            get { return _lecturaQR; }
            set { SetValue(ref _lecturaQR, value); }
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
        #endregion
        #region Procesos
        public async Task ValidarQR(string codigo)
        {
            //IsBusy = true;
            //IsEnable = false;
            
            try
            {
                var client = new HttpClient();
                var CIA = Preferences.Get("CIA", 0);
                var EMPLEADO = Preferences.Get("EMPLEADO", 0);
                string uri = "http://cgyasc2014-001-site6.ctempurl.com/api/ubicacion?UBICACION=" + codigo + "&CIA=" + CIA.ToString() + "&EMPLEADO=" + EMPLEADO.ToString();
                var response = await client.GetStringAsync(uri);
                var resultado = JsonConvert.DeserializeObject<bool>(response);
                if (resultado)
                {
                    var ubicacion = codigo.Split('-');
                    if (ubicacion.Length == 3)
                        LecturaQR = ubicacion[2];
                    else
                    {
                        LecturaQR = ubicacion[1];
                    }
                }
                else
                {
                    LecturaQR = "Desconocida";
                    await DisplayAlert("Error", "La ubicación scaneada no es correcta", "Ok");
                }
            }
            catch (Exception e)
            {
                await DisplayAlert("Error", e.Message, "Ok");
            }

        }
        public async Task LeerQR()
        {
             await Task.Delay(1000); 
        //    try
        //    {
        //        var scaner = new ZXing.Mobile.MobileBarcodeScanner();
        //        scaner.TopText = "Apunta al codigo QR";
        //        scaner.BottomText = "Centrar bien el codigo";
        //        var result = await scaner.Scan();
        //        if (result != null)
        //        {
        //            await ValidarQR(result.Text);
        //            //IsBusy = true;
        //            //IsEnable = false;
        //        }
        //        else
        //        {
        //            LecturaQR = "Desconocida";
        //            await DisplayAlert("Información:", "No se ha encontrado un QR para scanear", "Ok");
        //        }
        //    }
        //    catch (Exception e)
        //    {
        //        await DisplayAlert("Error:", e.Message, "Ok");
        //    }
        }
        #endregion
        #region Comandos
        public ICommand CommandLeerQR => new Command(async () => await LeerQR());
        #endregion
    }
}

