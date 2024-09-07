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
    public static Respuesta VerificarRespuesta(int idPregunta, int idRespuesta)
    {

        Respuesta respuestaSeleccionada = respuestas.Find(r => r.IdRespuesta == idRespuesta);

        bool rta = respuestaSeleccionada.Correcta;

        if (rta)
        {
            puntajeActual += 10;
            cantidadPreguntasCorrectas++;
        }

        Respuesta respuestaCorrecta = respuestas.Find(r => r.IdPregunta == idPregunta && r.Correcta == true);

        preguntas.Remove(preguntas.Find(preg => preg.IdPregunta == idPregunta));

        return respuestaCorrecta;
    }



}
