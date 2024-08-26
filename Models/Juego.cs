public class Juego
{
    private static string username { get; set; }
    private static int puntajeActual { get; set; }
    private static int cantidadPreguntasCorrectas { get; set; }
    private static List<Pregunta> preguntas { get; set; }
    private static List<Respuesta> respuestas { get; set; }


    public void InicializarJuego()
    {
        username = "";
        puntajeActual = 0;
        cantidadPreguntasCorrectas = 0;
    }
    public List<Categoria> ObtenerCategorias()
    {

        return BD.ObtenerCategorias();
    }

    public List<Dificultad> ObtenerDificultades()
    {

        return BD.ObtenerDificultades();
    }
    public void CargarPartida(string username, int dificultad, int categoria)
    {
        preguntas = BD.ObtenerPreguntas(dificultad, categoria);
        respuestas = BD.ObtenerRespuestas(preguntas);

    }
    public Pregunta ObtenerProximaPregunta()
    {
        Random rd = new Random();
        int nroRandom = rd.Next(0, (preguntas.Count+1));
        Pregunta proxPregunta = preguntas[nroRandom];
        return proxPregunta;
    }

    public List<Respuesta> ObtenerProximasRespuestas(int idPregunta) 
    { 
        List<Respuesta> ProxRespuestas = respuestas[idPregunta].IdRespuesta;
        

        return ListaRespuestas; 
    }
}
