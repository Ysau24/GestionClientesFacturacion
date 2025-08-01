

using CapaEntidad;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace CapaAccesoDatos
{
    public class D_DetalleFactura
    {
        SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["conectar"].ConnectionString);

        //MÉTODOS NECESARIOS: 

        //Método para mostrar todos los detalles de las facturas al iniciar el sistema

        public DataTable TodosLosDetallesDeFactura()
        {
            conexion.Open();

            SqlCommand command = new SqlCommand("TodosLosDetallesDeFactura", conexion);
            command.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter dataAdapter = new SqlDataAdapter(command);

            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);

            conexion.Close();

            return dataTable;
        }

        //Método para agregar los detalles de la factura


        public void AgregarDetallesDeFactura(E_DetalleFactura detalle) 
        {
            conexion.Open();

            SqlCommand command = new SqlCommand("RegistrarDetalleFactura", conexion);
            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@IdFactura", detalle.IdFactura);
            command.Parameters.AddWithValue("@Descripción", detalle.Descripción);
            command.Parameters.AddWithValue("@Cantidad", detalle.Cantidad);
            command.Parameters.AddWithValue("@Precio", detalle.Precio);


            command.ExecuteNonQuery();
            conexion.Close();
        }

    }
}
