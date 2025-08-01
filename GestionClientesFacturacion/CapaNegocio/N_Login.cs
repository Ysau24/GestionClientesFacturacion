

using CapaAccesoDatos;
using CapaEntidad;

namespace CapaNegocio
{
    public class N_Login
    {
        D_Login datos = new D_Login();

        public bool ValidarUsuario(E_Login usuario)
        {
            return datos.ValidarUsuario(usuario);
        }
    }
}
