package org.iesvdm.jsp_servlet_jdbc.servlet;

import jakarta.servlet.http.HttpServletRequest;
import org.iesvdm.jsp_servlet_jdbc.model.Socio;

import java.util.Objects;
import java.util.Optional;

public class UtilServlet {

    public static Optional<Socio> validaGrabar(HttpServletRequest request) {

        //CÓDIGO DE VALIDACIÓN
        boolean valida = true;
        //int socioID = -1;
        String nombre = null;
        int estatura = -1;
        int edad = -1;
        String localidad = null;
        try {
            Objects.requireNonNull(request.getParameter("nombre"));

            if (request.getParameter("nombre").isBlank()) throw new RuntimeException("Parámetro vacío o todo espacios blancos.");
            nombre = request.getParameter("nombre");
            estatura = Integer.parseInt(request.getParameter("estatura"));
            edad = Integer.parseInt(request.getParameter("edad"));


            Objects.requireNonNull(request.getParameter("localidad"));
            if (request.getParameter("localidad").isBlank()) throw new RuntimeException("Parámetro vacío o todo espacios blancos.");
            localidad = request.getParameter("localidad");

            return Optional.of(new Socio(-1, nombre, estatura, edad, localidad));

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        //FIN CÓDIGO DE VALIDACIÓN
        return Optional.empty();

    }


}
