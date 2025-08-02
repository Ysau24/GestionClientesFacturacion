using CapaEntidad;
using CapaNegocio;
using System;
using System.Data;
using System.Windows.Forms;

namespace CapaPresentacion
{
    public partial class DetalleFactura : Form, ILoadData
    {
        //Objetos de la capa de negocio y entidad necesarios para gestionar los detalles de factura

        N_DetalleFactura objN_DetalleFactura = new N_DetalleFactura();
        E_DetalleFactura objE_DetalleFactura = new E_DetalleFactura();

        public DetalleFactura()
        {
            InitializeComponent();
            LoadData();
        }

        private void closeButton_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void logInButtom_Click(object sender, EventArgs e)
        {
            logIn logIn = new logIn();
            logIn.Show();
            this.Close();
        }

        private void buttonBack_Click(object sender, EventArgs e)
        {
            Facturas facturas = new Facturas();
            facturas.Show();
            this.Close();
        }

        public void LoadData()
        {
            DataTable dataTable = objN_DetalleFactura.MostrandoTodosLosDetallesDeFactura();

            ListaDeDetallesFacturas.DataSource = dataTable;  //Este es mi dataGridView que lo estoy enlazando con mi dataTable 

            ListaDeDetallesFacturas.ClearSelection();
        }

        private void ActualizarButtom_Click(object sender, EventArgs e)
        {
            LoadData();
        }

        private void AgregarButton_Click(object sender, EventArgs e)
        {
            IDTxt.Enabled = true;
            DescripcionTxt.Enabled = true;
            PrecioTxt.Enabled = true;
            CantidadTxt.Enabled = true;
        }

        private void GuardarButtom_Click(object sender, EventArgs e)
        {
            objE_DetalleFactura.IdFactura = Convert.ToInt32(IDTxt.Text);
            objE_DetalleFactura.Descripción = DescripcionTxt.Text;
            objE_DetalleFactura.Cantidad = Convert.ToInt32(CantidadTxt.Text);
            objE_DetalleFactura.Precio = Convert.ToDecimal(PrecioTxt.Text);

            objN_DetalleFactura.AgregandoDetallesDeFactura(objE_DetalleFactura);


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
            DescripcionTxt.Clear();
            CantidadTxt.Clear();
            PrecioTxt.Clear();
        }
    }
}
