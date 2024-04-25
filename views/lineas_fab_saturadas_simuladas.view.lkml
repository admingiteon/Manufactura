view: lineas_fab_saturadas_simuladas {
  derived_table: {
    sql: WITH TotalPuestosTrabajo AS (
          SELECT DISTINCT puesto_trabajo FROM `eon-bus-proj-cadena-demo.modelo_de_calculo_sm.LP_PT_Fabricacion_Final`
      ),
      LineasSaturadas AS (
          SELECT DISTINCT puesto_trabajo FROM `eon-bus-proj-cadena-demo.modelo_de_calculo_sm.LP_PT_Fabricacion_Final`
          WHERE producible < 100
      ),
      LineasNoSaturadas AS (
          SELECT puesto_trabajo FROM TotalPuestosTrabajo
          WHERE puesto_trabajo NOT IN (SELECT puesto_trabajo FROM LineasSaturadas)
      )

      SELECT 'Total' AS concepto,
      COUNT(puesto_trabajo) as quantity
      FROM TotalPuestosTrabajo

      UNION ALL

      SELECT 'Lineas de Fabricación Saturadas' AS concepto,
      COUNT(puesto_trabajo) as quantity
      FROM LineasSaturadas

      UNION ALL

      SELECT 'Lineas de Fabricación No Saturadas' AS concepto,
      COUNT(puesto_trabajo) as quantity
      FROM LineasNoSaturadas
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
