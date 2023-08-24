
view: vw_largo_plazo_cfabricacion {
  derived_table: {
    sql: SELECT * FROM `psa-psa-cadena-qa.reporting_ecc_mx.vw_largo_plazo_cfabricacion` ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: Total_cantidad {
    type: sum
   sql: ${TABLE}.cantidad ;;
    value_format: "0.00"
    drill_fields: [detail*]
  }

  dimension: id_concepto {
    type: number
    sql: ${TABLE}.id_concepto ;;
  }





  dimension: sku {
    primary_key: yes
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension: concepto {
    type: string
    sql: ${TABLE}.concepto ;;
  }

  dimension: planta {
    type: string
    sql: ${TABLE}.planta ;;
  }

  dimension: describeplanta {
    type: string
    sql: ${TABLE}.describeplanta ;;
  }



  dimension: periodo_num {
    type: string
    sql: ${TABLE}.PeriodoNum ;;
  }

  dimension: periodo {
    type: string
    sql: ${TABLE}.periodo ;;
  }

  dimension: cantidad {
    type: number
    sql: ${TABLE}.cantidad ;;
  }

  set: detail {
    fields: [
        id_concepto,
  concepto,
  planta,
  describeplanta,
  sku,
  periodo_num,
  periodo,
  cantidad
    ]
  }
}
