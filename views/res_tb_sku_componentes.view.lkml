
view: res_tb_sku_componentes {
  derived_table: {
    sql: SELECT * FROM psa-psa-cadena-qa.reporting_ecc_mx.tb_sku_componentes ;;
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


  dimension: componente_n1 {
    type: string
    sql: ${TABLE}.ComponenteN1 ;;
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

  dimension: componente_n2 {
    type: string
    sql: ${TABLE}.ComponenteN2 ;;
  }

  dimension: componente_e2 {
    type: number
    sql: ${TABLE}.componenteE2 ;;
  }

  dimension: componente_b2 {
    type: number
    sql: ${TABLE}.componenteB2 ;;
  }

  dimension: componente_c2 {
    type: number
    sql: ${TABLE}.componenteC2 ;;
  }

  dimension: componente_u2 {
    type: string
    sql: ${TABLE}.ComponenteU2 ;;
  }

  dimension: componente_n3 {
    type: string
    sql: ${TABLE}.ComponenteN3 ;;
  }

  dimension: componente_e3 {
    type: number
    sql: ${TABLE}.componenteE3 ;;
  }

  dimension: componente_b3 {
    type: number
    sql: ${TABLE}.componenteB3 ;;
  }

  dimension: componente_c3 {
    type: number
    sql: ${TABLE}.componenteC3 ;;
  }

  dimension: componente_u3 {
    type: string
    sql: ${TABLE}.ComponenteU3 ;;
  }

  dimension: componente_n4 {
    type: string
    sql: ${TABLE}.ComponenteN4 ;;
  }

  dimension: componente_e4 {
    type: number
    sql: ${TABLE}.componenteE4 ;;
  }

  dimension: componente_b4 {
    type: number
    sql: ${TABLE}.componenteB4 ;;
  }

  dimension: componente_c4 {
    type: number
    sql: ${TABLE}.componenteC4 ;;
  }

  dimension: componente_u4 {
    type: string
    sql: ${TABLE}.ComponenteU4 ;;
  }

  dimension: componente_n5 {
    type: string
    sql: ${TABLE}.ComponenteN5 ;;
  }

  dimension: componente_e5 {
    type: number
    sql: ${TABLE}.componenteE5 ;;
  }

  dimension: componente_b5 {
    type: number
    sql: ${TABLE}.componenteB5 ;;
  }

  dimension: componente_c5 {
    type: number
    sql: ${TABLE}.componenteC5 ;;
  }

  dimension: componente_u5 {
    type: string
    sql: ${TABLE}.ComponenteU5 ;;
  }

  dimension: componente_n6 {
    type: string
    sql: ${TABLE}.ComponenteN6 ;;
  }

  dimension: componente_e6 {
    type: number
    sql: ${TABLE}.componenteE6 ;;
  }

  dimension: componente_b6 {
    type: number
    sql: ${TABLE}.componenteB6 ;;
  }

  dimension: componente_c6 {
    type: number
    sql: ${TABLE}.componenteC6 ;;
  }

  dimension: componente_u6 {
    type: string
    sql: ${TABLE}.ComponenteU6 ;;
  }

  dimension: componente_n7 {
    type: string
    sql: ${TABLE}.ComponenteN7 ;;
  }

  dimension: componente_e7 {
    type: number
    sql: ${TABLE}.componenteE7 ;;
  }

  dimension: componente_b7 {
    type: number
    sql: ${TABLE}.componenteB7 ;;
  }

  dimension: componente_c7 {
    type: number
    sql: ${TABLE}.componenteC7 ;;
  }

  dimension: componente_u7 {
    type: string
    sql: ${TABLE}.ComponenteU7 ;;
  }

  dimension: componente_n8 {
    type: string
    sql: ${TABLE}.ComponenteN8 ;;
  }

  dimension: componente_e8 {
    type: number
    sql: ${TABLE}.componenteE8 ;;
  }

  dimension: componente_b8 {
    type: number
    sql: ${TABLE}.componenteB8 ;;
  }

  dimension: componente_c8 {
    type: number
    sql: ${TABLE}.componenteC8 ;;
  }

  dimension: componente_u8 {
    type: string
    sql: ${TABLE}.ComponenteU8 ;;
  }

  dimension: componente_n9 {
    type: string
    sql: ${TABLE}.ComponenteN9 ;;
  }

  dimension: componente_e9 {
    type: number
    sql: ${TABLE}.componenteE9 ;;
  }

  dimension: componente_b9 {
    type: number
    sql: ${TABLE}.componenteB9 ;;
  }

  dimension: componente_c9 {
    type: number
    sql: ${TABLE}.componenteC9 ;;
  }

  dimension: componente_u9 {
    type: string
    sql: ${TABLE}.ComponenteU9 ;;
  }

  dimension: componente_n10 {
    type: string
    sql: ${TABLE}.ComponenteN10 ;;
  }

  dimension: componente_e10 {
    type: number
    sql: ${TABLE}.componenteE10 ;;
  }

  dimension: componente_b10 {
    type: number
    sql: ${TABLE}.componenteB10 ;;
  }

  dimension: componente_c10 {
    type: number
    sql: ${TABLE}.componenteC10 ;;
  }

  dimension: componente_u10 {
    type: string
    sql: ${TABLE}.ComponenteU10 ;;
  }

  dimension: componente_n11 {
    type: string
    sql: ${TABLE}.ComponenteN11 ;;
  }

  dimension: componente_e11 {
    type: number
    sql: ${TABLE}.componenteE11 ;;
  }

  dimension: componente_b11 {
    type: number
    sql: ${TABLE}.componenteB11 ;;
  }

  dimension: componente_c11 {
    type: number
    sql: ${TABLE}.componenteC11 ;;
  }

  dimension: componente_u11 {
    type: string
    sql: ${TABLE}.ComponenteU11 ;;
  }

  dimension: componente_n12 {
    type: string
    sql: ${TABLE}.ComponenteN12 ;;
  }

  dimension: componente_e12 {
    type: number
    sql: ${TABLE}.componenteE12 ;;
  }

  dimension: componente_b12 {
    type: number
    sql: ${TABLE}.componenteB12 ;;
  }

  dimension: componente_c12 {
    type: number
    sql: ${TABLE}.componenteC12 ;;
  }

  dimension: componente_u12 {
    type: string
    sql: ${TABLE}.ComponenteU12 ;;
  }

  dimension: componente_n13 {
    type: string
    sql: ${TABLE}.ComponenteN13 ;;
  }

  dimension: componente_e13 {
    type: number
    sql: ${TABLE}.componenteE13 ;;
  }

  dimension: componente_b13 {
    type: number
    sql: ${TABLE}.componenteB13 ;;
  }

  dimension: componente_c13 {
    type: number
    sql: ${TABLE}.componenteC13 ;;
  }

  dimension: componente_u13 {
    type: string
    sql: ${TABLE}.ComponenteU13 ;;
  }

  dimension: componente_n14 {
    type: string
    sql: ${TABLE}.ComponenteN14 ;;
  }

  dimension: componente_e14 {
    type: number
    sql: ${TABLE}.componenteE14 ;;
  }

  dimension: componente_b14 {
    type: number
    sql: ${TABLE}.componenteB14 ;;
  }

  dimension: componente_c14 {
    type: number
    sql: ${TABLE}.componenteC14 ;;
  }

  dimension: componente_u14 {
    type: string
    sql: ${TABLE}.ComponenteU14 ;;
  }

  dimension: componente_n15 {
    type: string
    sql: ${TABLE}.ComponenteN15 ;;
  }

  dimension: componente_e15 {
    type: number
    sql: ${TABLE}.componenteE15 ;;
  }

  dimension: componente_b15 {
    type: number
    sql: ${TABLE}.componenteB15 ;;
  }

  dimension: componente_c15 {
    type: number
    sql: ${TABLE}.componenteC15 ;;
  }

  dimension: componente_u15 {
    type: string
    sql: ${TABLE}.ComponenteU15 ;;
  }

  set: detail {
    fields: [
        centro,
  sku,
  componente_n1,
  componente_e1,
  componente_b1,
  componente_c1,
  componente_u1,
  componente_n2,
  componente_e2,
  componente_b2,
  componente_c2,
  componente_u2,
  componente_n3,
  componente_e3,
  componente_b3,
  componente_c3,
  componente_u3,
  componente_n4,
  componente_e4,
  componente_b4,
  componente_c4,
  componente_u4,
  componente_n5,
  componente_e5,
  componente_b5,
  componente_c5,
  componente_u5,
  componente_n6,
  componente_e6,
  componente_b6,
  componente_c6,
  componente_u6,
  componente_n7,
  componente_e7,
  componente_b7,
  componente_c7,
  componente_u7,
  componente_n8,
  componente_e8,
  componente_b8,
  componente_c8,
  componente_u8,
  componente_n9,
  componente_e9,
  componente_b9,
  componente_c9,
  componente_u9,
  componente_n10,
  componente_e10,
  componente_b10,
  componente_c10,
  componente_u10,
  componente_n11,
  componente_e11,
  componente_b11,
  componente_c11,
  componente_u11,
  componente_n12,
  componente_e12,
  componente_b12,
  componente_c12,
  componente_u12,
  componente_n13,
  componente_e13,
  componente_b13,
  componente_c13,
  componente_u13,
  componente_n14,
  componente_e14,
  componente_b14,
  componente_c14,
  componente_u14,
  componente_n15,
  componente_e15,
  componente_b15,
  componente_c15,
  componente_u15
    ]
  }
}
