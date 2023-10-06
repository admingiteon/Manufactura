
view: vw_consolidado_codigos_sku {
  derived_table: {
    sql: SELECT * FROM `psa-psa-cadena-qa.reporting_ecc_mx.vw_consolidado_codigos_sku` ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: material {

    type: string
    sql: ${TABLE}.material ;;
  }

  set: detail {
    fields: [
        material
    ]
  }
}
