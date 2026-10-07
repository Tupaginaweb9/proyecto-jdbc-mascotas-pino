package com.mascotaspino.dao;

import com.mascotaspino.conexion.ConexionBD;
import com.mascotaspino.modelo.Producto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductoDAOImpl implements ProductoDAO {

    private static final String INSERTAR_SQL =
            "INSERT INTO producto "
            + "(imagen, nombre, id_categoria, descripcion, precio, stock) "
            + "VALUES (?, ?, ?, ?, ?, ?)";

    private static final String CONSULTAR_SQL =
            "SELECT p.id_producto, p.imagen, p.nombre, "
            + "p.id_categoria, c.nombre AS categoria_nombre, "
            + "p.descripcion, p.precio, p.stock "
            + "FROM producto p "
            + "INNER JOIN categoria c ON c.id_categoria = p.id_categoria "
            + "ORDER BY p.id_producto";

    private static final String ACTUALIZAR_SQL =
            "UPDATE producto SET imagen = ?, nombre = ?, id_categoria = ?, "
            + "descripcion = ?, precio = ?, stock = ? "
            + "WHERE id_producto = ?";

    private static final String ELIMINAR_SQL =
            "DELETE FROM producto WHERE id_producto = ?";

    @Override
    public boolean insertar(Producto producto) throws SQLException {
        try (Connection conexion = ConexionBD.obtenerConexion();
             PreparedStatement sentencia = conexion.prepareStatement(INSERTAR_SQL)) {

            sentencia.setString(1, producto.getImagen());
            sentencia.setString(2, producto.getNombre());
            sentencia.setInt(3, producto.getIdCategoria());
            sentencia.setString(4, producto.getDescripcion());
            sentencia.setBigDecimal(5, producto.getPrecio());
            sentencia.setInt(6, producto.getStock());

            return sentencia.executeUpdate() > 0;
        }
    }

    @Override
    public List<Producto> consultarTodos() throws SQLException {
        List<Producto> productos = new ArrayList<>();

        try (Connection conexion = ConexionBD.obtenerConexion();
             PreparedStatement sentencia = conexion.prepareStatement(CONSULTAR_SQL);
             ResultSet resultado = sentencia.executeQuery()) {

            while (resultado.next()) {
                Producto producto = new Producto();
                producto.setIdProducto(resultado.getInt("id_producto"));
                producto.setImagen(resultado.getString("imagen"));
                producto.setNombre(resultado.getString("nombre"));
                producto.setIdCategoria(resultado.getInt("id_categoria"));
                producto.setCategoriaNombre(resultado.getString("categoria_nombre"));
                producto.setDescripcion(resultado.getString("descripcion"));
                producto.setPrecio(resultado.getBigDecimal("precio"));
                producto.setStock(resultado.getInt("stock"));
                productos.add(producto);
            }
        }

        return productos;
    }

    @Override
    public boolean actualizar(Producto producto) throws SQLException {
        try (Connection conexion = ConexionBD.obtenerConexion();
             PreparedStatement sentencia = conexion.prepareStatement(ACTUALIZAR_SQL)) {

            sentencia.setString(1, producto.getImagen());
            sentencia.setString(2, producto.getNombre());
            sentencia.setInt(3, producto.getIdCategoria());
            sentencia.setString(4, producto.getDescripcion());
            sentencia.setBigDecimal(5, producto.getPrecio());
            sentencia.setInt(6, producto.getStock());
            sentencia.setInt(7, producto.getIdProducto());

            return sentencia.executeUpdate() > 0;
        }
    }

    @Override
    public boolean eliminar(int idProducto) throws SQLException {
        try (Connection conexion = ConexionBD.obtenerConexion();
             PreparedStatement sentencia = conexion.prepareStatement(ELIMINAR_SQL)) {

            sentencia.setInt(1, idProducto);
            return sentencia.executeUpdate() > 0;
        }
    }
}
