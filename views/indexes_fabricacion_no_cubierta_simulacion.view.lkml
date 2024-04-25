view: indexes_fabricacion_no_cubierta_simulacion {
  derived_table: {
    sql:WITH tblmain AS (
    SELECT
        inv.material,
        DATE(inv.fecha) AS fecha,
        COALESCE(inv.cantidad_requerida, 0) AS cantidad_requerida,
        COALESCE(fab.producible, 0) AS cobertura_fab
    FROM
        `modelo_de_calculo_sm.LP_PT_Inventario_LU_1` AS inv
    LEFT JOIN
        `modelo_de_calculo_sm.LP_PT_Fabricacion_Final` AS fab
        ON inv.material = fab.material AND inv.fecha = fab.fecha
),
total AS (
    SELECT
      COUNT(DISTINCT material) as total_materials
    FROM tblmain
),
ProbFab AS (
    SELECT
        material,
        SUM(cantidad_requerida) > SUM(cobertura_fab) AS is_problem
    FROM
        tblmain
    GROUP BY
        material
)

SELECT
    'Total' AS concepto,
    (SELECT total_materials FROM total) as quantity
UNION ALL
SELECT
    'Productos con Problemas de Fabricación' AS concepto,
    COUNT(*) as quantity
FROM
    ProbFab
WHERE
    is_problem
UNION ALL
SELECT
    'Productos Sin Problemas de Fabricación' AS concepto,
    (SELECT total_materials FROM total) - COUNT(*) as quantity
FROM
    ProbFab
WHERE
    is_problem

      ;;
  }


  dimension: concepto {
    type: string
    sql: ${TABLE}.concepto ;;
  }



  measure: quantity{
    type: sum
    sql: ${TABLE}.quantity ;;
  }
}
