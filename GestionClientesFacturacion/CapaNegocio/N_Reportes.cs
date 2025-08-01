

using CapaAccesoDatos;
using System.Data;

namespace CapaNegocio
{
    public class N_Reportes
    {
        D_Reportes objD_Reportes = new D_Reportes();
        public DataTable MostrandoFacturacionPorCliente()
        {
            return objD_Reportes.FacturacionPorCliente();
        }

        public DataTable MostrandoFacturacionPorPeriodo()
        {
            return objD_Reportes.FacturacionPorPeriodo();
        }

    }
}