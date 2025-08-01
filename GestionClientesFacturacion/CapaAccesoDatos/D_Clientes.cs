

using CapaEntidad;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace CapaAccesoDatos
{
    public class D_Clientes
    {
        SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["conectar"].ConnectionString);

        //MÉTODOS NECESARIOS: 

        //Método para mostrar todos los clientes al iniciar el sistema
        public DataTable TodosLosClientes()
        {
            conexion.Open();

            SqlCommand command = new SqlCommand("ObtenerClientes", conexion);
            command.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter dataAdapter = new SqlDataAdapter(command);

            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);

            conexion.Close();

            return dataTable;
        }

        //Metodo para buscar un cliente por nombre

        public DataTable BuscarCliente(string Buscar)
        {
            DataTable dataTable = new DataTable();

            conexion.Open();

            SqlCommand command = new SqlCommand("BuscarCliente", conexion);
            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@Buscar", Buscar);

            SqlDataAdapter dataAdapter = new SqlDataAdapter(command);

            dataAdapter.Fill(dataTable);

            conexion.Close();

            return dataTable;
        }

        //Metodo para agregar un nuevo cliente

        public void AgregarCliente(E_Clientes clientes) 
        {
            conexion.Open();

            SqlCommand command = new SqlCommand("InsertarCliente", conexion);
            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@Nombre", clientes.Nombre);
            command.Parameters.AddWithValue("@Telefono", clientes.Telefono);
            command.Parameters.AddWithValue("@Correo", clientes.Correo);

            command.ExecuteNonQuery();
            conexion.Close();
        }

        //Metodo para editar un cliente

        public void EditarCliente(E_Clientes clientes)
        {
            conexion.Open();

            SqlCommand command = new SqlCommand("ActualizarCliente", conexion);
            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@IdCliente", clientes.IdCliente);
            command.Parameters.AddWithValue("@Nombre", clientes.Nombre);
            command.Parameters.AddWithValue("@Telefono", clientes.Telefono);
            command.Parameters.AddWithValue("@Correo", clientes.Correo);

            command.ExecuteNonQuery();
            conexion.Close();
        }


        //Método para eliminar un cliente

        public void EliminarCliente(E_Clientes clientes)
        {
            conexion.Open();

            SqlCommand command = new SqlCommand("EliminarCliente", conexion);
            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@IdCliente", clientes.IdCliente);

            command.ExecuteNonQuery();
            conexion.Close();
        }


    }
}
