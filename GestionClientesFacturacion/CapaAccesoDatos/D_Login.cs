

using CapaEntidad;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace CapaAccesoDatos
{
    public class D_Login
    {
        SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["conectar"].ConnectionString);

        //Método para validar el usuario al iniciar la sesion

        public bool ValidarUsuario(E_Login usuario)
        {
            SqlCommand cmd = new SqlCommand("ValidarUsuario", conexion);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@usuario", usuario.Usuario);
            cmd.Parameters.AddWithValue("@contrasena", usuario.Contraseña);

            conexion.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            bool existe = reader.HasRows;
            reader.Close();
            conexion.Close();

            return existe;

        }
    }
}
