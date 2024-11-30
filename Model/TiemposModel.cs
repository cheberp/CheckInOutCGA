using System;
namespace CheckInOutCGA.Model
{
    public class TiemposModel
    {
        public string PERIODO { get; set; }
        public string ENTRADA { get; set; }
        public string SALIDA { get; set; }
        public string CHECADAS { get; set; }
        public string HORAS { get; set; }
        public string HORARIO { get; set; }

        public TiemposModel()
        {
            PERIODO = "";
            ENTRADA="";
            SALIDA="";
            CHECADAS="";
            HORAS="";
            HORARIO="";
        }
    }




}

