view: almacenes_excedidos {
  derived_table: {
    sql:
    SELECT * FROM `eon-bus-proj-cadena-demo.modelo_de_calculo.reporting_manufactura_vw_almacenes_excedidos`) as t

      ;;
  }


  dimension: centro {
    type: string
    sql: ${TABLE}.centro ;;
  }

  dimension: fecha {
    type: date
    sql:  ${TABLE}.fecha;;

  }

  measure: ocupacion_final{
    label: "Ocupación Final"
    type: number
    sql: ${TABLE}.max_ocupacion_final ;;
  }

  measure: porcentaje_ocupacion{
    label: "Porcentaje Ocupación"
    type: number
    sql: ${TABLE}.porcentaje_ocupacion ;;
  }

}
