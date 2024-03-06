
view: escenarios {
  derived_table: {
    sql: SELECT Escenario_id FROM `eon-bus-proj-cadena-demo.p_reporting_ecc_mx._backuptb_largo_plazo_trazabilidad_nv_prueba_multiples_escenarios` group by Escenario_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: escenario_id {
    type: string
    sql: cast(${TABLE}.Escenario_id as string) ;;
  }

  set: detail {
    fields: [
        escenario_id
    ]
  }
}
