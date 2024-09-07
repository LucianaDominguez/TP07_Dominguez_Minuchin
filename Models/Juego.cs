using System.Collections.Generic;
public static class Juego
{
    public static string Username { get; private set; }
    public static int puntajeActual { get; private set; }
    private static int cantidadPreguntasCorrectas { get; set; }
    private static List<Pregunta> preguntas { get; set; } = new List<Pregunta>();
    private static List<Respuesta> respuestas { get; set; } = new List<Respuesta>();


    public static void InicializarJuego()
    {
        Username = "";
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
        Username = username;

    }
    public static Pregunta ObtenerProximaPregunta()
    {
        Pregunta proxPregunta;
        Random rd = new Random();
        if (preguntas.Count == 0)
        {
            proxPregunta = null;
        }
        else
        {
            int nroRandom = rd.Next(0, (preguntas.Count));
            proxPregunta = preguntas[nroRandom];
        }

        return proxPregunta;
    }

    public static List<Respuesta> ObtenerProximasRespuestas(int idPregunta)
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
    public static bool VerificarRespuesta(int idPregunta, int idRespuesta)
    {
        bool rta = respuestas.Find(r => r.IdRespuesta == idRespuesta).Correcta;
        if (rta)
        {
            puntajeActual += 10;
            cantidadPreguntasCorrectas++;
        }
        preguntas.Remove(preguntas.Find(preg => preg.IdPregunta == idPregunta));
        return rta;
    }

    /* public static  bool VerificarRespuesta(int idPregunta, int idRespuesta)
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
     } ver verificacion */
}
