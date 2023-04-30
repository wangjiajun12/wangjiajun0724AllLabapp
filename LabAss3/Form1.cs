using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.Rebar;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ToolTip;

namespace LabAss3
{
    public partial class Form1 : Form
    {


        public Form1()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void btnPreview_Click(object sender, EventArgs e)
        {
            string Gender, Hobby, Status = "";

            if (radioMale.Checked) Gender = "Male";
            else Gender = "Female";
            if (chkReading.Checked) Hobby = "Reading";
            else Hobby = "Painting";
            if (radioMarried.Checked) Status = "Married";
            else Status = "Unmarried";
            try
            {
                CustomerValidation objVal = new CustomerValidation();
                objVal.CheckCustomerName(txtName.Text);


                frmCustomerPreview objPreview = new frmCustomerPreview();
                objPreview.Show();
                objPreview.SetValues(txtName.Text, lblCountry.Text, Gender, Hobby, Status);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // TODO: 这行代码将数据加载到表“customerDBDataSet.Customer”中。您可以根据需要移动或移除它。
            this.customerTableAdapter.Fill(this.customerDBDataSet.Customer);
        }
        private void loadCustomer()
        {
            string strConnection = "Data Source=LAPTOP-LUIA5960;Initial Catalog=CustomerDB;Integrated Security=True;Pooling=False";
            SqlConnection objConnection = new SqlConnection(strConnection);
            objConnection.Open();

            string strCommand = "Select * From Customer";
            SqlCommand objCommand = new SqlCommand(strCommand, objConnection);

            DataSet objDataSet = new DataSet();
            SqlDataAdapter objAdapter = new SqlDataAdapter(objCommand);
            objAdapter.Fill(objDataSet);
            dtgCustomer.DataSource = objDataSet.Tables[0];

            objConnection.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string Gender, Hobby, Status = "";
            if (radioMale.Checked) Gender = " Male "; 
            else Gender = " Female ";
            if (chkReading.Checked) Hobby = " Reading ";
            else Hobby = "Painting";
            if (radioMarried.Checked) Status = "1";
            else Status = "0";
            
            // Open a Connection 
            string strConnection = "Data Source=LAPTOP-LUIA5960;Initial Catalog=CustomerDB;Integrated Security=True;Pooling=False";
            SqlConnection objConnection = new SqlConnection(strConnection);
            objConnection.Open();
            // Fire a Command 
            string strCommand = " insert into Customer ( CustomerName , Country , Gender , Hobby , Married ) values ('" + txtName.Text + "','"
            + cmbCountry.Text + "','"
            + Gender + "','"
            + Hobby + "',"
            + Status + " )";
            SqlCommand objCommand = new SqlCommand(strCommand, objConnection);
            objCommand.ExecuteNonQuery();
           
            objConnection.Close();
            loadCustomer();
        }

        private void dtgCustomer_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dtgCustomer_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            clearForm();

            string id = dtgCustomer.Rows[e.RowIndex].Cells[0].Value.ToString();
            displayCustomer(id);

        }

        private void displayCustomer(string id)
        {
            string strConnection = "Data Source=LAPTOP-LUIA5960;Initial Catalog=CustomerDB;Integrated Security=True;Pooling=False";
            SqlConnection objConnection = new SqlConnection(strConnection);
            objConnection.Open();

           

            string strCommand = "Select * From Customer where id =" + id;

            SqlCommand objCommand = new SqlCommand(strCommand, objConnection);

            

            DataSet objDataSet = new DataSet() ;

            SqlDataAdapter objAdapter = new SqlDataAdapter(objCommand);

            objAdapter.Fill(objDataSet);

            objConnection.Close();
            lblID.Text = objDataSet.Tables[0].Rows[0][0].ToString().Trim(); ;

            txtName .Text  = objDataSet .Tables[0].Rows [0][1].ToString ().Trim ();

            cmbCountry.Text = objDataSet.Tables[0].Rows[0][2].ToString().Trim();

            string Gender = objDataSet.Tables[0].Rows[0][3].ToString().Trim();

            if (Gender.Equals("Male")) radioMale.Checked = true;

            else radioFemale.Checked = true;

            string Hobby = objDataSet.Tables[0].Rows[0][4].ToString() . Trim();

            if (Hobby . Equals("Reading")) chkReading . Checked = true;

else chkPainting.Checked = true;

            string Married = objDataSet.Tables[0].Rows[0][5].ToString().Trim();

            if (Married.Equals("True")) radioMarried.Checked = true;

            else radioUnmarried.Checked = true;
        }

        private void clearForm()
        {
            txtName.Text = "";
            cmbCountry.Text = "";
            radioMale.Checked = false;
            radioFemale.Checked = false; 
            chkPainting.Checked = false; 
            chkReading.Checked = false; 
            radioMarried.Checked = false; 
            radioUnmarried.Checked = false;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            string Gender, Hobby, Status = "";
            if (radioMale.Checked) Gender = "Male";
            else Gender = "Female";
            if (chkReading.Checked) Hobby = "Reading";
            else Hobby = "Painting";
            if (radioMarried.Checked) Status = "1";
            else Status = "0";

            string strConnection = "Data Source=LAPTOP-LUIA5960;Initial Catalog=CustomerDB;Integrated Security=True;Pooling=False";
            SqlConnection objConnection = new SqlConnection(strConnection);
            objConnection.Open();

            string strCommand = "UPDATE Customer SET CustomerName =@CustomerName, Country=@Country," + "Gender=@Gender,Hobby=@Hobby,Married= @Married WHERE id=@id";
            SqlCommand objCommand = new SqlCommand(strCommand, objConnection);
            objCommand.Parameters.AddWithValue("@CustomerName", txtName.Text.Trim());
            objCommand.Parameters.AddWithValue("@Country", cmbCountry.SelectedItem.ToString().Trim());
            objCommand.Parameters.AddWithValue("@Gender", Gender);
            objCommand.Parameters.AddWithValue("@Hobby", Hobby);
            objCommand.Parameters.AddWithValue("@Married", Status);
            objCommand.Parameters.AddWithValue("@id", lblID.Text.Trim());
            objCommand.ExecuteNonQuery();

            objConnection.Close();
            clearForm();
            loadCustomer();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            string strConnection = "Data Source=LAPTOP-LUIA5960;Initial Catalog=CustomerDB;Integrated Security=True;Pooling=False";
            SqlConnection objConnection = new SqlConnection(strConnection);
            objConnection.Open();

            string strCommand = "Delete from Customer where id ='" + lblID.Text + "'";
            SqlCommand objCommand = new SqlCommand(strCommand, objConnection);
            objCommand.ExecuteNonQuery();

            objConnection.Close();
            clearForm();
            loadCustomer();
        }
    } }
    
