using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using Newtonsoft.Json;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;


namespace Proyecto_ST
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuariologueado"] != null)
            {
                string usuariologueado = Session["usuariologueado"].ToString();
                lblBienvenida.Text = "Bienvenido/a " + usuariologueado;
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        protected void BtnCerrar_Click(object sender, EventArgs e)
        {
            Session.Remove("usuariologueado");
            Response.Redirect("Login.aspx");
        }
        [WebMethod]
        public static string ObtenerInfoUsuario()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            List<object> usuario = new List<object>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("SELECT * FROM usuario", connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    usuario.Add(new
                    {
                        Id_usuario = reader["ID_usuario"].ToString(),
                        Nombre = reader["Nombre"].ToString(),
                        Correo = reader["Correo"].ToString(),
                        Direccion = reader["Direccion"].ToString(),
                        Telefono = reader["Telefono"].ToString(),
                        Edad = reader["Edad"].ToString()
                    });
                }
            }
            return Newtonsoft.Json.JsonConvert.SerializeObject(usuario);
        }
        [WebMethod]
        public static string ObtenerCalificaciones()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            List<object> calificaciones = new List<object>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("SELECT * FROM calificacion", connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    calificaciones.Add(new
                    {
                        Id_calificacion = reader["id_calificacion"].ToString(),
                        Id_servicio = reader["id_servicio"].ToString(),
                        Id_usuario = reader["id_usuario"].ToString(),
                        Calificacion = reader["calificacion"].ToString()
                    });
                }
            }
            return Newtonsoft.Json.JsonConvert.SerializeObject(calificaciones);
        }

    }
}
