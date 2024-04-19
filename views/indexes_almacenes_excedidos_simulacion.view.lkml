view: indexes_almacenes_excedidos_simulacion {
    derived_table: {
      sql:
      WITH TotalAlmacenes AS (
      SELECT COUNT(DISTINCT centro) AS total_centros
      FROM `eon-bus-proj-cadena-demo.reporting_manufactura.vw_almacenes_excedidos_sm`
      ),

      AlmacenesExcedidos AS (
      SELECT COUNT(DISTINCT centro) AS total_centros_excedidos
      FROM `eon-bus-proj-cadena-demo.reporting_manufactura.vw_almacenes_excedidos_sm` sm
      WHERE porcentaje_ocupacion >= 100 OR porcentaje_ocupacion < 0
      ),

      AlmacenesOcupados AS (
      SELECT COUNT(DISTINCT centro) AS centros_con_exceso_ocupacion
      FROM `eon-bus-proj-cadena-demo.reporting_manufactura.vw_almacenes_excedidos_sm`
      WHERE porcentaje_ocupacion >= 80
      )

      SELECT
        'total_centros_excedidos' AS concepto,
        (SELECT COUNT(*) FROM AlmacenesExcedidos) AS quantity
      UNION ALL
      SELECT
      'total_centros_con_ocupacion_mayor_a_80' as concept,
        (SELECT COUNT(*) FROM AlmacenesOcupados) AS quantity
      UNION ALL
      SELECT
      'Total' AS concept,
      total_centros  AS quantity FROM TotalAlmacenes;;
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
