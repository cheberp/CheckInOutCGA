using System;
namespace CheckInOutCGA.Model
{
	public class ChecadasSemanaModel
	{
        public int PERIODO { get; set; }
        public int EMPLEADO { get; set; }
        public string FECHA { get; set; }
        public string UBICACION { get; set; }

        public ChecadasSemanaModel()
        {
            PERIODO=0;
            EMPLEADO=0;
            FECHA="";
            UBICACION="";

        }
    }
    
}

