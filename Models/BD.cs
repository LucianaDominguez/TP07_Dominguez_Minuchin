using System.Data.SqlClient;
using Dapper;

public class BD
{
    public static List<Categoria> _ListaCategorias;
    public static List<Dificultad> _ListaDificultades;
    public static List<Pregunta> _ListaPreguntas;
    public static List<Respuesta> _ListaRespuestas;
    // cambiar a @"Server=localhost para ORT;
    //cambiar a @"Server=LAPTOP-58GA0SUJ\SQLEXPRESS; para compu Lu
    private static string _connectionString = @"Server=LAPTOP-58GA0SUJ\SQLEXPRESS;
DataBase=PreguntadORT;Trusted_Connection=True;";
    public static List<Categoria> ObtenerCategorias()
    {
        string sql = "SELECT * FROM Categorias";
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            
            _ListaCategorias = db.Query<Categoria>(sql).ToList();
        }

        return _ListaCategorias;
    }
    public static List<Dificultad> ObtenerDificultades()
    {
        string sql = "SELECT * FROM Dificultades";
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            
            _ListaDificultades = db.Query<Dificultad>(sql).ToList();
        }

        return _ListaDificultades;
    }
    public static List<Pregunta> ObtenerPreguntas(int dificultad, int categoria)
    {
        List<Pregunta> _ListaPreguntas = new List<Pregunta>();
        using (SqlConnection db = new SqlConnection(_connectionString))
        
        {
            if (dificultad == -1 && categoria == -1)
            {

                string sql = "SELECT * FROM Preguntas";
                _ListaPreguntas = db.Query<Pregunta>(sql).ToList();

            }
            else if (dificultad == -1)
            {

                string sql = "SELECT * FROM Preguntas WHERE IdCategoria = @pCategoria";
                _ListaPreguntas = db.Query<Pregunta>(sql, new { pCategoria = categoria }).ToList();

            }
            else if (categoria == -1)
            {

                string sql = "SELECT * FROM Preguntas WHERE IdDificultad = @pDificultad";
                _ListaPreguntas = db.Query<Pregunta>(sql, new { pDificultad = dificultad }).ToList();

            }
            else
            {

                string sql = "SELECT * FROM Preguntas WHERE IdCategoria = @pCategoria AND IdDificultad = @pDificultad";
                _ListaPreguntas = db.Query<Pregunta>(sql, new { pCategoria = categoria, pDificultad = dificultad }).ToList();

            }
        }

        return _ListaPreguntas;
    }
    public static List<Respuesta> ObtenerRespuestas(List<Pregunta> preguntas)
    {

        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            foreach (Pregunta item in preguntas)
            {
                string sql = "SELECT * FROM Respuestas WHERE IdPregunta = @pPregunta";
                List<Respuesta> respuestas = db.Query<Respuesta>(sql, new { pPregunta = item.IdPregunta }).ToList();
                _ListaRespuestas.AddRange(respuestas);
            }

        }

        return _ListaRespuestas;
    }
}