package org.iesvdm.jsp_servlet_jdbc.servlet;

import jakarta.servlet.http.HttpServletRequest;
import org.iesvdm.jsp_servlet_jdbc.model.Socio;

import java.util.Objects;
import java.util.Optional;

import static java.lang.Double.isNaN;
import static java.lang.Integer.parseInt;

public class UtilServlet {

    public static Optional<Socio> validarSocio(HttpServletRequest request) {

        //CÓDIGO DE VALIDACIÓN
        boolean valida = true;
        int socioID = -1;
        String nombre = null;
        int estatura = -1;
        int edad = -1;
        String localidad = null;
        try {
            Objects.requireNonNull(request.getParameter("nombre"));

            if (request.getParameter("nombre").isBlank()) throw new RuntimeException("Parámetro vacío o todo espacios blancos.");
            nombre = request.getParameter("nombre");
            estatura = parseInt(request.getParameter("estatura"));
            edad = parseInt(request.getParameter("edad"));


            Objects.requireNonNull(request.getParameter("localidad"));
            if (request.getParameter("localidad").isBlank()) throw new RuntimeException("Parámetro vacío o todo espacios blancos.");
            localidad = request.getParameter("localidad");

            if(request.getParameter("socioID") != null){
                socioID = parseInt(request.getParameter("socioID"));
            }

            return Optional.of(new Socio(socioID, nombre, estatura, edad, localidad));

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        //FIN CÓDIGO DE VALIDACIÓN
        return Optional.empty();

    }


}
