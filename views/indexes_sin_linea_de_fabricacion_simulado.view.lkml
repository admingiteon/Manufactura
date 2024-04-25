view: indexes_sin_linea_de_fabricacion_simulado {
  derived_table: {
    sql:WITH total AS (
        SELECT
          COUNT(DISTINCT material) AS total_count
        FROM
          `modelo_de_calculo_sm.LP_PT_Inventario_LU_1`
      ),
      capFab AS (
        SELECT
          COUNT(DISTINCT Sku) AS capfab_count
        FROM
          `eon-bus-proj-cadena-demo.data_foundation.reporting_ecc_mx_vw_largo_plazo_fabricacion_capacidadFabrica`
        where Sku in (SELECT
          DISTINCT material AS total_count
        FROM
          `modelo_de_calculo_sm.LP_PT_Inventario_LU_1`)
      )
      select 'Total' as concepto,
      total_count as quantity from total
      UNION ALL
      SELECT
      'Productos sin Lineas de Fabricación' as concepto,
        (SELECT total_count FROM total) - (SELECT capfab_count FROM capFab) AS quantity
      UNION ALL
      SELECT
      'Productos Con Lineas de Fabricación' as concepto,
        (SELECT capfab_count FROM capFab) AS quantity;;
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
