view: lineas_fab_saturadas {

  derived_table: {
    sql: select 'Total' AS concepto,
    count(distinct(puesto_trabajo)) as quantity
    from `eon-bus-proj-cadena-demo.modelo_de_calculo.LP_PT_Fabricacion_Final`

  UNION ALL
    select 'Lineas de Fabricación Saturadas' AS concepto,
    count(distinct(puesto_trabajo)) as quantity
    from `eon-bus-proj-cadena-demo.modelo_de_calculo.LP_PT_Fabricacion_Final`
    where producible < 100 ;;
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
