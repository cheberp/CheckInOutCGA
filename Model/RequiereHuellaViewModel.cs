using System;
namespace CheckInOutCGA.Model
{
    public class RequiereHuellaModel
    {
        public string USUARIO { get; set; }
        public string APLICACION { get; set; }
        public string TK { get; set; }
        public bool REQUIERE_AUT { get; set; }
        public int CIA { get; set; }

        public RequiereHuellaModel()
         {
            this.USUARIO = "";
            this.APLICACION = "";
            this.TK = "";
            this.REQUIERE_AUT = false;
            this.CIA = 0;
        }
        public RequiereHuellaModel(string _usuario,string _aplicacion,string _tk,bool _requiere_aut,int cia)
        {
            this.USUARIO = _usuario;
            this.APLICACION = _aplicacion;
            this.TK = _tk;
            this.REQUIERE_AUT = _requiere_aut;
            this.CIA = cia;
        }
    }
    
}

