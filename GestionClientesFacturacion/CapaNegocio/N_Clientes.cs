using CapaAccesoDatos;
using CapaEntidad;
using System.Data;

namespace CapaNegocio
{
    public class N_Clientes
    {
        D_Clientes objD_Cliente = new D_Clientes();

        public DataTable MostrandoTodosLosClientes() 
        { 
            return objD_Cliente.TodosLosClientes();
        }

        public DataTable BuscandoCliente(string Buscar) 
        {
            return objD_Cliente.BuscarCliente(Buscar);
        }

        public void AgregandoCliente(E_Clientes clientes) 
        {
            objD_Cliente.AgregarCliente(clientes);
        }

        public void EditandoCliente(E_Clientes clientes) 
        {
            objD_Cliente.EditarCliente(clientes);
        }

        public void EliminadoCliente(E_Clientes clientes) 
        {
            objD_Cliente.EliminarCliente(clientes);
        }
    }
}
