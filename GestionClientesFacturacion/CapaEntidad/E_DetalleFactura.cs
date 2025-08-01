
namespace CapaEntidad
{
    public class E_DetalleFactura: E_Base
    {
        private int _idDetalle;
        private string _Descripción;
        private int _Cantidad;
        private decimal _Precio;
        private decimal _Subtotal;

        public int IdDetalle { get => _idDetalle; set => _idDetalle = value; }
        public string Descripción { get => _Descripción; set => _Descripción = value; }
        public int Cantidad { get => _Cantidad; set => _Cantidad = value; }
        public decimal Precio { get => _Precio; set => _Precio = value; }
        public decimal Subtotal { get => _Subtotal; set => _Subtotal = value; }
    }
}
