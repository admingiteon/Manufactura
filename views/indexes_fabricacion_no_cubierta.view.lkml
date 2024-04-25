view: indexes_fabricacion_no_cubierta {
  derived_table: {
    sql:WITH tblmain AS (
    SELECT
        inv.material,
        DATE(inv.fecha) AS fecha,
        COALESCE(inv.cantidad_requerida, 0) AS cantidad_requerida,
        COALESCE(fab.producible, 0) AS cobertura_fab
    FROM
        `modelo_de_calculo.LP_PT_Inventario_LU_1` AS inv
    LEFT JOIN
        `modelo_de_calculo.LP_PT_Fabricacion_Final` AS fab
        ON inv.material = fab.material AND DATE(inv.fecha) = DATE(fab.fecha)
),
ProbFab AS (
    SELECT
        material,
        fecha,
        SUM(cantidad_requerida) AS sum_cantidad_requerida,
        SUM(cobertura_fab) AS sum_cobertura_fab
    FROM
        tblmain
    GROUP BY
        material,fecha
),
total AS (
  SELECT
    'Total' AS concepto,
    COUNT(distinct(material)) as quantity
FROM tblmain
)

SELECT
    concepto,
    quantity
FROM total

UNION ALL

SELECT
    'Productos con Problemas de Fabricación' AS concepto,
    COUNT(distinct(material)) as quantity
FROM
    ProbFab
WHERE
    sum_cantidad_requerida > sum_cobertura_fab


UNION ALL

SELECT
    'Productos Sin Problemas de Fabricación' AS concepto,
    (SELECT quantity FROM total WHERE concepto = 'Total') - COUNT(distinct(material)) as quantity,
FROM
    ProbFab
WHERE
    sum_cantidad_requerida > sum_cobertura_fab

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
