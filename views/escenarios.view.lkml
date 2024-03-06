
view: escenarios {
  derived_table: {
    sql: SELECT Escenario_id FROM `eon-bus-proj-cadena-demo.data_foundation.reporting_ecc_mx_tb_largo_plazo_trazabilidad_nv` group by Escenario_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: escenario_id {
    type: number
    sql: ${TABLE}.Escenario_id ;;
  }

  set: detail {
    fields: [
        escenario_id
    ]
  }
}
