

using System;

namespace CapaEntidad
{
    public class E_Facturas: E_Base
    {
        private DateTime _Fecha;
        private decimal _Total;
        private string _Estado;

        public DateTime Fecha { get => _Fecha; set => _Fecha = value; }
        public decimal Total { get => _Total; set => _Total = value; }
        public string Estado { get => _Estado; set => _Estado = value; }
    }
}
