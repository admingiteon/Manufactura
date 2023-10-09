
view: vw_consolidado_codigos_sku {
  derived_table: {
    sql: SELECT * FROM `psa-psa-cadena-qa.reporting_ecc_mx.vw_consolidado_codigos_sku` ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: material {
    primary_key: yes
    type: string
    sql: ${TABLE}.material ;;
  }

  dimension: sku {
    type: string
    sql: SUBSTR(${TABLE}.material,12,10) ;;
  }

  set: detail {
    fields: [
        material
    ]
  }
}
