view: indexes_fabricacion_no_cubierta_simulacion_2 {
  derived_table: {
    sql:WITH tblmain AS (
    SELECT
        SUBSTR(ins.id, 1, INSTR(ins.id, '_') - 1) as material,
        ins.posicion_actual AS posicion_actual_insumo,
        DATE(ins.fecha) as fecha,
        ins.cantidadrequerida AS cantidad_requerida_insumo
    FROM
        `modelo_de_calculo_sm.LP_Insumo_Inventario_1` AS ins
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
    'Productos con Desabasto de Insumos' AS concepto,
    COUNT(DISTINCT CASE
        WHEN posicion_actual_insumo < cantidad_requerida_insumo
            AND fecha <= CURRENT_DATE THEN material
        ELSE NULL
    END) AS quantity
FROM
    Desabasto

UNION ALL

SELECT
    'Productos sin Desabasto de Insumos' AS concepto,
    (SELECT quantity FROM total WHERE concepto = 'Total') - COUNT(DISTINCT CASE
        WHEN posicion_actual_insumo < cantidad_requerida_insumo
            AND fecha <= CURRENT_DATE THEN material
        ELSE NULL
    END) as quantity
FROM
    Desabasto;;
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
