

using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace CapaAccesoDatos
{
    public class D_Reportes
    {
        SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["conectar"].ConnectionString);

        //Método para ver facturación por cliente

        public DataTable FacturacionPorCliente()
        {
            conexion.Open();

            SqlCommand command = new SqlCommand("VerFacturasPorCliente", conexion);
            command.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter dataAdapter = new SqlDataAdapter(command);

            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);

            conexion.Close();

            return dataTable;
        }

        //Método para ver facturación por periodo

        public DataTable FacturacionPorPeriodo()
        {
            conexion.Open();

            SqlCommand command = new SqlCommand("VerFacturasPorPeriodo", conexion);
            command.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter dataAdapter = new SqlDataAdapter(command);

            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);

            conexion.Close();

            return dataTable;
        }
    }
}
