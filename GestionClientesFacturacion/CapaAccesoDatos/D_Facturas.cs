

using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using CapaEntidad;

namespace CapaAccesoDatos
{
    public class D_Facturas
    {
        SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["conectar"].ConnectionString);

        //MÉTODOS NECESARIOS: 

        //Método para mostrar todos las facturas al iniciar el sistema
        public DataTable TodasLasFacturas()
        {
            conexion.Open();

            SqlCommand command = new SqlCommand("TodasLasFacturas", conexion);
            command.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter dataAdapter = new SqlDataAdapter(command);

            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);

            conexion.Close();

            return dataTable;
        }

        //Método para registrar las facturas

        public void RegistrarFactura(E_Facturas facturas) 
        {
            conexion.Open();

            SqlCommand command = new SqlCommand("RegistrarFactura", conexion);
            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@IdCliente", facturas.IdCliente);
            command.Parameters.AddWithValue("@Fecha", facturas.Fecha);
            command.Parameters.AddWithValue("@Total", facturas.Total);

            command.ExecuteNonQuery();
            conexion.Close();
        }

    }
}
