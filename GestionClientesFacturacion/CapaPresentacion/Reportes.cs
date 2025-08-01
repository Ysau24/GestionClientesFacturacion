using CapaNegocio;
using System;
using System.Data;
using System.Windows.Forms;

namespace CapaPresentacion
{
    public partial class Reportes : Form
    {
        N_Reportes objN_Reportes = new N_Reportes();
        public Reportes()
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

        private void button5_Click(object sender, EventArgs e)
        {
            lobby lobby = new lobby();
            lobby.Show();
            this.Close();
        }

        public void LoadFacturacionPorCliente()
        {
            DataTable dataTable = objN_Reportes.MostrandoFacturacionPorCliente();

            ListaDeReportes.DataSource = dataTable;  //Este es mi dataGridView que lo estoy enlazando con mi dataTable 

            ListaDeReportes.ClearSelection();

        }

        public void LoadFacturacionPorPeriodo()
        {
            DataTable dataTable = objN_Reportes.MostrandoFacturacionPorPeriodo();

            ListaDeReportes.DataSource = dataTable;  //Este es mi dataGridView que lo estoy enlazando con mi dataTable 

            ListaDeReportes.ClearSelection();
        }

        private void AgregarButton_Click(object sender, EventArgs e)
        {
            LoadFacturacionPorCliente();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            LoadFacturacionPorPeriodo();
        }
    }
}
