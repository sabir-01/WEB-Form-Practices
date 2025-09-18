using System;
using System.Web.UI;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace Working_with_foreignkey
{
    public partial class _Default : Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCountryDDl();
                BindGrid();
                reset();
            }
        }
        void BindCountryDDl()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from country";
            SqlDataAdapter sda = new SqlDataAdapter(query ,con);
            DataTable data = new DataTable();
            sda.Fill(data); 
            CountryDropDownList.DataSource = data;
            CountryDropDownList.DataTextField = "country_name";
            CountryDropDownList.DataValueField = "country_id";
            CountryDropDownList.DataBind(); 
            ListItem selectitem = new ListItem("select country ", "select country");
            selectitem.Selected = true; 
            CountryDropDownList.Items.Insert(0, selectitem);    
        }
        void BindCityDDl(int country_id)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from city where c_id = @country_id";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            sda.SelectCommand.Parameters.AddWithValue("@country_id", country_id);
            DataTable data = new DataTable();
            sda.Fill(data);
            CityDropDownList.DataSource = data;
            CityDropDownList.DataTextField = "city_name";
            CityDropDownList.DataValueField = "city_id";  
            CityDropDownList.DataBind();
            ListItem selectitem = new ListItem("select City ", "select City");
            selectitem.Selected = true;
            CityDropDownList.Items.Insert(0, selectitem);
        }

        protected void CountryDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int country_id = Convert.ToInt32(CountryDropDownList.SelectedValue);
                BindCityDDl(country_id);
            }      
            catch(Exception ex) { 
                 Response.Write("<script>alert('Country Required !') </script>");
            }
        }
        void BindGrid()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT L.log_id, C.country_name, CI.city_name, L.selected_date
                         FROM LocationLog L
                         INNER JOIN country C ON L.country_id = C.country_id
                         INNER JOIN city CI ON L.city_id = CI.city_id
                         ORDER BY L.log_id DESC";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable data = new DataTable();
                sda.Fill(data);
                GridView1.DataSource = data;
                GridView1.DataBind();
            } 
        }

        void reset()
        {
            if (CountryDropDownList.Items.Count > 0)
            {
                CountryDropDownList.SelectedIndex = 0; 
            }

            if (CityDropDownList.Items.Count > 0)
            {
                CityDropDownList.SelectedIndex = 0; 
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(
                    "INSERT INTO LocationLog (country_id, city_id) VALUES (@country_id, @city_id)", con);
                cmd.Parameters.AddWithValue("@country_id", Convert.ToInt32(CountryDropDownList.SelectedValue));
                cmd.Parameters.AddWithValue("@city_id", Convert.ToInt32(CityDropDownList.SelectedValue));
                con.Open();
                cmd.ExecuteNonQuery();
            }
            BindGrid();
            reset();
        }

      
    }
}