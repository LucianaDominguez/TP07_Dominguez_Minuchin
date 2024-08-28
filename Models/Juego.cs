public static class Juego
{
    private static string username { get; set; }
    private static int puntajeActual { get; set; }
    private static int cantidadPreguntasCorrectas { get; set; }
    private static List<Pregunta> preguntas { get; set; }
    private static List<Respuesta> respuestas { get; set; }


    public static void InicializarJuego()
    {
        username = "";
        puntajeActual = 0;
        cantidadPreguntasCorrectas = 0;
    }
    public static List<Categoria> ObtenerCategorias()
    {

        return BD.ObtenerCategorias();
    }

    public static List<Dificultad> ObtenerDificultades()
    {

        return BD.ObtenerDificultades();
    }
    public static void CargarPartida(string username, int dificultad, int categoria)
    {
        preguntas = BD.ObtenerPreguntas(dificultad, categoria);
        respuestas = BD.ObtenerRespuestas(preguntas);

    }
    public static Pregunta ObtenerProximaPregunta()
    {
        Random rd = new Random();
        int nroRandom = rd.Next(0, (preguntas.Count + 1));
        Pregunta proxPregunta = preguntas[nroRandom];
        return proxPregunta;
    }

    public static  List<Respuesta> ObtenerProximasRespuestas(int idPregunta)
    {
        List<Respuesta> ProxRespuestas = new List<Respuesta>();
        foreach (Respuesta r in respuestas)
        {
            if (r.IdPregunta == idPregunta)
            {
                ProxRespuestas.Add(r);
            }

        }
        return ProxRespuestas;

    }
    public static  bool VerificarRespuesta(int idPregunta, int idRespuesta)
    {
        bool respuesta = false;
        if (respuestas[idPregunta].IdRespuesta == idRespuesta)
        {
            respuesta = true;
            puntajeActual += 10;
            cantidadPreguntasCorrectas += 1;
        } 
        preguntas.RemoveAt(idPregunta);
        return respuesta;
    }
}
