using System.Data.SqlClient;
using Dapper;

public class BD{
    public static List<string> _ListaCategorias; 
private static string _connectionString = @"Server=localhost;
DataBase=PreguntadORT;Trusted_Connection=True;";
    public static List<string> ObtenerCategorias()
    { 
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT Nombre FROM Categorias";
            _ListaCategorias = db.Query<string>(sql).ToList();
        }
        
        return _ListaCategorias; 
    }
}