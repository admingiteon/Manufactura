view: indexes_fabricacion_no_cubierta {
  derived_table: {
    sql:WITH tblmain AS (
    SELECT
        inv.material,
        DATE(inv.fecha) AS fecha,
        COALESCE(inv.cantidad_requerida, 0) AS cantidad_requerida,
        COALESCE(fab.producible, 0) AS cobertura_fab,
        ins.posicion_actual AS posicion_actual_insumo,
        ins.cantidadrequerida AS cantidad_requerida_insumo
    FROM
        `modelo_de_calculo.LP_PT_Inventario_LU_1` AS inv
    LEFT JOIN
        `modelo_de_calculo.LP_PT_Fabricacion_Final` AS fab
        ON inv.material = fab.material AND DATE(inv.fecha) = DATE(fab.fecha)
    LEFT JOIN
        `modelo_de_calculo.LP_Insumo_Inventario_1` AS ins
        ON inv.material = SUBSTR(ins.id, 1, INSTR(ins.id, '_') - 1) AND DATE(inv.fecha) = DATE(ins.fecha)
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
Desabasto AS(
    SELECT
        material,
        fecha,
        SUM(posicion_actual_insumo) as posicion_actual_insumo,
        SUM(cantidad_requerida_insumo) as cantidad_requerida_insumo
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
    'SKUs con Problemas de Fabricación' AS concepto,
    COUNT(distinct(material)) as quantity
FROM
    ProbFab
WHERE
    sum_cantidad_requerida > sum_cobertura_fab


UNION ALL

SELECT
    'SKUs con Problemas de Fabricación Complemento' AS concepto,
    (SELECT quantity FROM total WHERE concepto = 'Total') - COUNT(distinct(material)) as quantity,
FROM
    ProbFab
WHERE
    sum_cantidad_requerida > sum_cobertura_fab

UNION ALL

SELECT
    'Desabasto de Insumos' AS concepto,
    COUNT(DISTINCT CASE
        WHEN posicion_actual_insumo < cantidad_requerida_insumo
            AND fecha <= CURRENT_DATE THEN material
        ELSE NULL
    END) AS quantity
FROM
    Desabasto

UNION ALL

SELECT
    'Desabasto de Insumos Complemento' AS concepto,
    (SELECT quantity FROM total WHERE concepto = 'Total') - COUNT(DISTINCT CASE
        WHEN posicion_actual_insumo < cantidad_requerida_insumo
            AND fecha <= CURRENT_DATE THEN material
        ELSE NULL
    END) as quantity
FROM
    Desabasto
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
