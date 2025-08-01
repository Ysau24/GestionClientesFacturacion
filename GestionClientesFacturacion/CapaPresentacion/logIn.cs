using CapaEntidad;
using CapaNegocio;
using System;
using System.Windows.Forms;

namespace CapaPresentacion
{
    public partial class logIn : Form
    {
        public logIn()
        {
            InitializeComponent();
        }

        private void closeButton_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void iniciarSesionButton_Click(object sender, EventArgs e)
        {
            // Crear objetos de la capa de entidad y negocio
            E_Login usuario = new E_Login();
            N_Login negocio = new N_Login();

            // Asignar valores de los TextBox a las propiedades de la entidad
            usuario.Usuario = UsuarioTxt.Text.Trim();
            usuario.Contraseña = ContraseñaTxt.Text.Trim();

            // Validar si los campos están vacíos
            if (string.IsNullOrWhiteSpace(usuario.Usuario) || string.IsNullOrWhiteSpace(usuario.Contraseña))
            {
                MessageBox.Show("Por favor, complete ambos campos.");
                return;
            }

            // Validar usuario en la capa de negocio
            bool esValido = negocio.ValidarUsuario(usuario);

            // Verificar si el usuario es válido
            if (esValido)
            {
                // Si el usuario es admin, se abre el lobby
                if (usuario.Usuario == "admin")  // Aquí verificamos si el usuario es admin
                {
                    lobby lobby = new lobby();
                    lobby.Show();
                    this.Hide();
                }
                else
                {
                    // Si no es admin, se abre la clase de Facturas
                    Facturas facturas = new Facturas();  // Cambia 'Facturas' al nombre de tu clase de facturas
                    facturas.Show();
                    facturas.ButtonBack.Visible = false;
                    this.Hide();
                }
            }
            else
            {
                MessageBox.Show("Usuario o contraseña incorrectos.");
            }

        }
    }
}
