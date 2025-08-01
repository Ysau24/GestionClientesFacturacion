using System;
using System.Data;
using CapaNegocio;
using System.Windows.Forms;
using CapaEntidad;

namespace CapaPresentacion
{
    public partial class Clientes : Form, ILoadData
    {
        //Propiedades

        N_Clientes objN_Cliente = new N_Clientes();
        E_Clientes objE_Cliente = new E_Clientes();

        private bool Editar = false;
        private int ID;

        public Clientes()
        {
            InitializeComponent();
            LoadData();
        }
        public void LoadData()
        {
            DataTable dataTable = objN_Cliente.MostrandoTodosLosClientes();

            ListaDeClientes.DataSource = dataTable;  //Este es mi dataGridView que lo estoy enlazando con mi dataTable 

            ListaDeClientes.ClearSelection();
        }
      
        private void closeButton_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void buttonBack_Click(object sender, EventArgs e)
        {
            lobby lobby = new lobby();
            lobby.Show();
            this.Close();
        }

        private void LogInButton_Click(object sender, EventArgs e)
        {
            logIn login = new logIn();
            login.Show();
            this.Close();
        }

        private void BuscadorClientes_TextChanged(object sender, EventArgs e)
        {
            ListaDeClientes.DataSource = objN_Cliente.BuscandoCliente(BuscadorClientes.Text);
        }

        private void ActualizarClientesButton_Click(object sender, EventArgs e)
        {
            LoadData();
        }

        private void AgregarClientesButton_Click(object sender, EventArgs e)
        {
            NombreTxt.Enabled = true;
            TelefonoTxt.Enabled = true;
            CorreoTxt.Enabled = true;
        }

        private void EditarClientesButton_Click(object sender, EventArgs e)
        {
            if (ListaDeClientes.SelectedRows.Count > 0)
            {
                Editar = true;

                NombreTxt.Enabled = true;
                TelefonoTxt.Enabled = true;
                CorreoTxt.Enabled = true;

                ID = Convert.ToInt32(ListaDeClientes.CurrentRow.Cells[0].Value);

                NombreTxt.Text = ListaDeClientes.CurrentRow.Cells[1].Value.ToString();
                CorreoTxt.Text = ListaDeClientes.CurrentRow.Cells[2].Value.ToString();
                TelefonoTxt.Text = ListaDeClientes.CurrentRow.Cells[3].Value.ToString();
            }
            else 
            {
                MessageBox.Show("Por favor, seleccione un cliente para editar.");
            }

        }

        private void GuardarButtom_Click(object sender, EventArgs e)
        {
            if (Editar == false)
            {
                objE_Cliente.Nombre = NombreTxt.Text;
                objE_Cliente.Telefono = TelefonoTxt.Text;   
                objE_Cliente.Correo = CorreoTxt.Text;

                objN_Cliente.AgregandoCliente(objE_Cliente);


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

                NombreTxt.Clear();
                TelefonoTxt.Clear();
                CorreoTxt.Clear();
            }
            else
            {
                objE_Cliente.IdCliente = ID;
                objE_Cliente.Nombre = NombreTxt.Text;
                objE_Cliente.Telefono = TelefonoTxt.Text;
                objE_Cliente.Correo = CorreoTxt.Text;

                objN_Cliente.EditandoCliente(objE_Cliente);

                DialogResult result = MessageBox.Show("¿Seguro/a que desea guardar el registro?",
                                                      "Cancelar",
                                                      MessageBoxButtons.YesNo,
                                                      MessageBoxIcon.Question);

                if (result == DialogResult.Yes)
                {
                    MessageBox.Show("Se guardó el registro");
                    LoadData();
                    Editar = false;
                }
                else
                {
                    return;
                }

                NombreTxt.Clear();
                TelefonoTxt.Clear();
                CorreoTxt.Clear();
            }

            NombreTxt.Enabled = false;
            TelefonoTxt.Enabled = false;
            CorreoTxt.Enabled = false;
        }

        private void EliminarClientesButton_Click(object sender, EventArgs e)
        {
            if (ListaDeClientes.SelectedRows.Count > 0)
            {

                // Obtener el id de la fila seleccionada

                ID = Convert.ToInt32(ListaDeClientes.CurrentRow.Cells[0].Value);
                objE_Cliente.IdCliente = ID;


                objN_Cliente.EliminadoCliente(objE_Cliente);

                

                DialogResult result = MessageBox.Show("¿Seguro/a que desea eliminar el registro?",
                                                      "Cancelar",
                                                      MessageBoxButtons.YesNo,
                                                      MessageBoxIcon.Question);

                if (result == DialogResult.Yes)
                {
                    LoadData();
                }
                else
                {
                    return;
                }


            }
            else
            {
                MessageBox.Show("Por favor, seleccione un cliente para eliminar.");
            }
        }
    }
}
