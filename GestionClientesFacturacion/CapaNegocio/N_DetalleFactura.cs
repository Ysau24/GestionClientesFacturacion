
using CapaAccesoDatos;
using CapaEntidad;
using System.Data;

namespace CapaNegocio
{
    public class N_DetalleFactura
    {
        D_DetalleFactura objD_DetalleFactura = new D_DetalleFactura();

        public DataTable MostrandoTodosLosDetallesDeFactura() 
        {
            return objD_DetalleFactura.TodosLosDetallesDeFactura();
        }

        public void AgregandoDetallesDeFactura(E_DetalleFactura detalle) 
        {
            objD_DetalleFactura.AgregarDetallesDeFactura(detalle);
        }
    }
}
