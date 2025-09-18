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
            CityDropDownList.DataValueField = "c_id";
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

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            Response.Write("selected country is :" + CountryDropDownList.SelectedItem.ToString() + "<br>") ;
            Response.Write("selected country Id  is :" + CountryDropDownList.SelectedValue.ToString() + "<br>");



            Response.Write("selected City is :" + CityDropDownList.SelectedItem.ToString() + "<br>");
            Response.Write("selected City Id  is :" + CityDropDownList.SelectedValue.ToString() + "<br>");
             
        }
    }
}