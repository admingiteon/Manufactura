
view: escenarios {
  derived_table: {
    sql: SELECT DISTINCT(trazabilidad.Escenario_id)
        FROM `eon-bus-proj-cadena-demo.data_foundation.reporting_ecc_mx_vw_largo_plazo_trazabilidad_nv_2` as trazabilidad
        --WHERE Escenario_id in(
        --     SELECT DISTINCT(escenario_id)
        --     FROM
        --    `eon-bus-proj-cadena-demo.modelo_de_calculo_sm.vw_LP_PT_Fabricacion_Final`
        --)
        ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: escenario_id {
    type: string
    sql: ${TABLE}.Escenario_id ;;
  }

  set: detail {
    fields: [
      escenario_id
    ]
  }
}
