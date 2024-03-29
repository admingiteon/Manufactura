view: indexes_almacenes_excedidos {
  derived_table: {
    sql:
WITH PorcentajeOcupacion AS (
  SELECT
    centro,
    fecha,
    capacidad_total_ubicacion,
    ocupacion_final,
    (ocupacion_final / capacidad_total_ubicacion * 100.0) AS porcentaje_ocupacion
  FROM modelo_de_calculo.LP_PT_Almacenamiento
),
AlmacenesExcedidos AS (
  SELECT
    centro,
    MAX(porcentaje_ocupacion) AS max_porcentaje_ocupacion
  FROM PorcentajeOcupacion
  GROUP BY centro
  HAVING MAX(porcentaje_ocupacion) >= 100
),
AlmacenesOcupados AS (
  SELECT
    centro,
    MAX(porcentaje_ocupacion) AS max_porcentaje_ocupacion
  FROM PorcentajeOcupacion
  GROUP BY centro
  HAVING MAX(porcentaje_ocupacion) >= 80
)
SELECT
  'total_centros_excedidos' AS concepto,
  (SELECT COUNT(*) FROM AlmacenesExcedidos) AS quantity
UNION ALL
SELECT
'total_centros_con_ocupacion_mayor_a_80' as concept,
  (SELECT COUNT(*) FROM AlmacenesOcupados) AS quantity ;;
  }

  dimension: concepto {
    type: string
    sql: ${TABLE}.concepto ;;
  }

  measure: quantity {
    type: sum
    sql: ${TABLE}.quantity ;;
  }


}
