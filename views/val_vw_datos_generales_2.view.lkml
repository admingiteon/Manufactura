view: val_vw_datos_generales_2 {

  derived_table: {
    sql: SELECT
  material,
  SUM(cantidad) AS diferencia
FROM (
  SELECT
    material,
    COUNT(DISTINCT material) AS cantidad
  FROM
    `eon-bus-proj-cadena-demo.modelo_de_calculo.LP_PT_Fabricacion_Final`
  GROUP BY material

  UNION ALL

  SELECT
    Sku as material,
    (-1) * COUNT(DISTINCT Sku) AS cantidad
  FROM
    `eon-bus-proj-cadena-demo.data_foundation.reporting_ecc_mx_vw_largo_plazo_fabricacion_capacidadFabrica`
  GROUP BY Sku
) AS subconsulta
GROUP BY material
  ;;
  }

dimension: sin_lineas_de_fabricacion {
  type: number
  sql: ${TABLE}.diferencia ;;
}

dimension: material {
  type: string
  sql: ${TABLE}.material ;;
}

}
