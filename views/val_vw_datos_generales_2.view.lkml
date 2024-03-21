#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines



view: val_vw_datos_generales_2 {

  derived_table: {
    sql: SELECT
  SUM(cantidad) AS diferencia
FROM (
  SELECT
    count(DISTINCT material) AS cantidad
  FROM
    `eon-bus-proj-cadena-demo.p_reporting_homologacion_mx.vw_cadena_suministro_datos_generales`
  WHERE
    grupo_articulos IN ('AM', 'A', 'T', 'O', 'L', 'E', 'G', 'K', 'GP', 'U', 'J', 'MI', 'M', 'MP', 'S', 'F', 'D', 'H', 'Q', 'PMD', 'SM', 'B', 'R', 'N', 'VDD')

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
