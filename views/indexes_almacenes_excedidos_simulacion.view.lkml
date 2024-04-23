view: indexes_almacenes_excedidos_simulacion {
    derived_table: {
      sql:
      WITH TotalAlmacenes AS (
    SELECT DISTINCT centro
    FROM `eon-bus-proj-cadena-demo.reporting_manufactura.vw_almacenes_excedidos_sm`
),
AlmacenesExcedidos AS (
    SELECT DISTINCT centro
    FROM `eon-bus-proj-cadena-demo.reporting_manufactura.vw_almacenes_excedidos_sm` sm
    WHERE porcentaje_ocupacion >= 100 OR porcentaje_ocupacion < 0
),
AlmacenesOcupados AS (
    SELECT DISTINCT centro
    FROM `eon-bus-proj-cadena-demo.reporting_manufactura.vw_almacenes_excedidos_sm`
    WHERE porcentaje_ocupacion >= 80
),
AlmacenesNoExcedidos AS (
    SELECT centro
    FROM TotalAlmacenes
    WHERE centro NOT IN (SELECT centro FROM AlmacenesExcedidos)
),
AlmacenesConOcupacionMenorA80 AS (
    SELECT centro
    FROM TotalAlmacenes
    WHERE centro NOT IN (SELECT centro FROM AlmacenesOcupados)
)

SELECT 'total_centros_excedidos' AS concepto,
       (SELECT COUNT(*) FROM AlmacenesExcedidos) AS quantity
UNION ALL
SELECT 'total_centros_con_ocupacion_mayor_a_80' AS concepto,
       (SELECT COUNT(*) FROM AlmacenesOcupados) AS quantity
UNION ALL
SELECT 'Total' AS concepto,
       (SELECT COUNT(*) FROM TotalAlmacenes) AS quantity
UNION ALL
SELECT 'total_centros_no_excedidos' AS concepto,
       (SELECT COUNT(*) FROM AlmacenesNoExcedidos) AS quantity
UNION ALL
SELECT 'total_centros_con_ocupacion_menor_a_80' AS concepto,
       (SELECT COUNT(*) FROM AlmacenesConOcupacionMenorA80) AS quantity
;;
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
