using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


namespace Proyecto_ST
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BtnIngresar_Click(object sender, EventArgs e)
        {
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            SqlConnection sqlConectar = new SqlConnection(conectar);
            string consulta = "SELECT * FROM administracion WHERE usuario = @usuario AND contrasena = @contrasena"; 
            SqlCommand cmd = new SqlCommand(consulta, sqlConectar);
           
            cmd.Connection.Open();
            cmd.Parameters.Add("@Usuario", SqlDbType.VarChar, 50).Value = tbUsuario.Text;
            cmd.Parameters.Add("@Contrasena", SqlDbType.VarChar, 50).Value = tbPassword.Text;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                //Agregamos una sesion de usuario
                Session["usuariologueado"] = tbUsuario.Text;
                Response.Redirect("Index.aspx");
            }
            else
            {
                lblError.Text = "Error de Usuario o Contrasena";
            }

            cmd.Connection.Close();
        }
    }
}
