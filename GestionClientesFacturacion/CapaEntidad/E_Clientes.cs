

namespace CapaEntidad
{
    public class E_Clientes: E_Base
    {
        private string _Nombre;
        private string _Correo;
        private string _Telefono;
        private string _Estado;

        public string Nombre { get => _Nombre; set => _Nombre = value; }
        public string Correo { get => _Correo; set => _Correo = value; }
        public string Telefono { get => _Telefono; set => _Telefono = value; }
        public string Estado { get => _Estado; set => _Estado = value; }
    }
}
