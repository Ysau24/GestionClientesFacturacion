

using CapaAccesoDatos;
using CapaEntidad;
using System.Data;

namespace CapaNegocio
{
    public class N_Facturas
    {
        D_Facturas objD_Factura = new D_Facturas();

        public DataTable MostrandoTodasLasFacturas()
        {
            return objD_Factura.TodasLasFacturas();
        }

        public void RegistrandoFactura(E_Facturas facturas) 
        {
            objD_Factura.RegistrarFactura(facturas);
        }
    }
}
