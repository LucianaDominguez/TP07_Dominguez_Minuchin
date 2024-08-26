using System.Data.SqlClient;
using Dapper;

public class BD{
    public static List<Categoria> _ListaCategorias; 
    public static List<Dificultad> _ListaDificultades;  
    
private static string _connectionString = @"Server=localhost;
DataBase=PreguntadORT;Trusted_Connection=True;";
    public static List<Categoria> ObtenerCategorias()
    { 
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT * FROM Categorias";
            _ListaCategorias = db.Query<Categoria>(sql).ToList();
        }
        
        return _ListaCategorias; 
    } 
    public static List<Dificultad> ObtenerDificultades()
    { 
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT * FROM Dificultades";
            _ListaDificultades = db.Query<Dificultad>(sql).ToList();
        }
        
        return _ListaDificultades; 
    } 
    //public static List<Pregunta> ObtenerPreguntas(int dificultad, int categoria) 
    //{

   // }
}