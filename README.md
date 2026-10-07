# Mascotas Pino - GA7-220501096-AA2-EV01

## Objetivo
Codificar el módulo de gestión de productos de Mascotas Pino mediante Java,
MySQL y JDBC.

## CRUD implementado
- Insertar producto.
- Consultar productos.
- Actualizar producto.
- Eliminar producto.

## Tecnologías
- Java 17
- Maven
- MySQL
- JDBC
- MySQL Connector/J
- Git/GitHub

## Estructura
- conexion: conexión JDBC.
- modelo: entidades.
- dao: acceso a datos.
- servicio: lógica de aplicación.
- vista: menú de prueba.

## Instalación
1. Crear la base de datos ejecutando `database/db_mascotas_pino.sql`.
2. Verificar que MySQL esté ejecutándose.
3. Revisar usuario y contraseña en `ConexionBD.java`.
4. Abrir el proyecto como proyecto Maven.
5. Ejecutar `mvn clean compile`.
6. Ejecutar `mvn exec:java`.

## Nomenclatura
- Paquetes: minúsculas.
- Clases: PascalCase.
- Métodos y variables: camelCase.
- Constantes: MAYUSCULAS_CON_GUION_BAJO.

## Seguridad técnica
Las consultas utilizan `PreparedStatement` y los recursos JDBC se gestionan
con try-with-resources.
