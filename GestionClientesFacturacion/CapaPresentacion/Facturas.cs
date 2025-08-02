using CapaEntidad;
using CapaNegocio;
using System;
using System.Data;
using System.Windows.Forms;

namespace CapaPresentacion
{
    public partial class Facturas : Form ,ILoadData
    {

        N_Facturas objN_Factura = new N_Facturas();
        E_Facturas objE_Factura = new E_Facturas();

        public Facturas()
        {
            InitializeComponent();
            LoadData();
        }

        public void LoadData()
        {
            DataTable dataTable = objN_Factura.MostrandoTodasLasFacturas();

            ListaDeFacturas.DataSource = dataTable;  //Este es mi dataGridView que lo estoy enlazando con mi dataTable 

            ListaDeFacturas.ClearSelection();
        }

        private void closeButton_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void LogInButton_Click(object sender, EventArgs e)
        {
            logIn login = new logIn();
            login.Show();
            this.Close();
        }
        private void ActualizarButtom_Click(object sender, EventArgs e)
        {
            LoadData();
        }
        private void AgregarButton_Click(object sender, EventArgs e)
        {
            IDTxt.Enabled = true;
            FechaTxt.Enabled = true;
            TotalTxt.Enabled = true;
        }
        private void detallesFactura_Click(object sender, EventArgs e)
        {
            DetalleFactura detalles = new DetalleFactura();
            detalles.Show();
            this.Close();
        }

        private void GuardarButtom_Click(object sender, EventArgs e)
        {
            objE_Factura.IdCliente = Convert.ToInt32(IDTxt.Text);
            objE_Factura.Fecha = Convert.ToDateTime(FechaTxt.Text);
            objE_Factura.Total = Convert.ToDecimal(TotalTxt.Text);

             objN_Factura.RegistrandoFactura(objE_Factura);


            DialogResult result = MessageBox.Show("¿Seguro/a que desea guardar el registro?",
                                                  "Cancelar",
                                                  MessageBoxButtons.YesNo,
                                                  MessageBoxIcon.Question);

            if (result == DialogResult.Yes)
            {
                MessageBox.Show("Se guardó el registro");
            }
            else
            {
                return;
            }

            IDTxt.Clear();
            FechaTxt.Clear();
            TotalTxt.Clear();
        }

        private void _buttonBack_Click(object sender, EventArgs e)
        {
            lobby lobby = new lobby();
            lobby.Show();
            this.Close();
        }
    }
}
