using System;
using System.Windows.Forms;

namespace CapaPresentacion
{
    public partial class lobby : Form
    {
        public lobby()
        {
            InitializeComponent();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            logIn login = new logIn();       
            login.Show();
            this.Close();
        }

        private void closeButton_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void iniciarSesionButton_Click(object sender, EventArgs e)
        {
            Clientes clientes = new Clientes();
            clientes.Show();
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Facturas facturas = new Facturas();
            facturas.Show();
            this.Close();

        }

        private void button2_Click(object sender, EventArgs e)
        {
            Reportes reportes = new Reportes();
            reportes.Show();
            this.Close();
        }
    }
}
