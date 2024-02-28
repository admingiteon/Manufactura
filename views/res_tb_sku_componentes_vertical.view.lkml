
view: res_tb_sku_componentes_vertical {
  derived_table: {
    sql: select * from psa-psa-cadena-qa.reporting_ecc_mx.tb_sku_componentes_vertical ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: centro {
    type: string
    sql: ${TABLE}.centro ;;
  }

  dimension: sku {
    type: string
    sql: SUBSTR(${TABLE}.SKU,12,10) ;;
  }


  dimension: componente_ns {
    type: string
    sql: ${TABLE}.ComponenteNS ;;
  }

  dimension: componente {
    type: string
    sql: ${TABLE}.Componente ;;
  }

  dimension: componente_e1 {
    type: number
    sql: ${TABLE}.componenteE1 ;;
  }

  dimension: componente_b1 {
    type: number
    sql: ${TABLE}.ComponenteB1 ;;
  }

  dimension: componente_c1 {
    type: number
    sql: ${TABLE}.ComponenteC1 ;;
  }

  dimension: componente_u1 {
    type: string
    sql: ${TABLE}.ComponenteU1 ;;
  }

  dimension: nivel {
    type: number
    sql: ${TABLE}.nivel ;;
  }


  measure: Cantidad {
    type: sum
    sql: ${TABLE}.ComponenteC1 ;;
  }


  set: detail {
    fields: [
        centro,
  sku,
  componente_ns,
  componente,
  componente_e1,
  componente_b1,
  componente_c1,
  componente_u1,
  nivel
    ]
  }
}
