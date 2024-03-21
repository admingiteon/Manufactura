view: val_vw_datos_generales_2 {

  derived_table: {
    sql: SELECT
  SUM(cantidad) AS diferencia
FROM (
SELECT
    count(DISTINCT sku) AS cantidad
  FROM
`eon-bus-proj-cadena-demo.data_foundation.reporting_ecc_mx_tb_largo_plazo_trazabilidad_nv`
  UNION ALL

  SELECT
    (-1) * count(DISTINCT Sku) AS cantidad
  FROM
    `eon-bus-proj-cadena-demo.data_foundation.reporting_ecc_mx_vw_largo_plazo_fabricacion_capacidadFabrica`
) AS subconsulta  ;;
  }

dimension: sin_lineas_de_fabricacion {
  type: number
  sql: ${TABLE}.diferencia ;;
}

}
