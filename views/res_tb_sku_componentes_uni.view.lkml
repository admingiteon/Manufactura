
view: res_tb_sku_componentes_uni {
  derived_table: {
    sql: SELECT centro,SKU,ComponenteN1 insumo,componenteE1 Stock_libre_uso,ComponenteU1 Unidad_Medida,1 nivel FROM psa-psa-cadena-qa.reporting_ecc_mx.tb_sku_componentes  union all
SELECT centro,SKU,ComponenteN2,componenteE2,ComponenteU2,2 nivel FROM psa-psa-cadena-qa.reporting_ecc_mx.tb_sku_componentes union all
SELECT centro,SKU,ComponenteN3,componenteE3,ComponenteU3,3 nivel FROM psa-psa-cadena-qa.reporting_ecc_mx.tb_sku_componentes union all
SELECT centro,SKU,ComponenteN4,componenteE4,ComponenteU4,4 nivel FROM psa-psa-cadena-qa.reporting_ecc_mx.tb_sku_componentes union all
SELECT centro,SKU,ComponenteN5,componenteE5,ComponenteU5,5 nivel FROM psa-psa-cadena-qa.reporting_ecc_mx.tb_sku_componentes union all
SELECT centro,SKU,ComponenteN6,componenteE6,ComponenteU6,6 nivel FROM psa-psa-cadena-qa.reporting_ecc_mx.tb_sku_componentes union all
SELECT centro,SKU,ComponenteN7,componenteE7,ComponenteU7,7 nivel FROM psa-psa-cadena-qa.reporting_ecc_mx.tb_sku_componentes union all
SELECT centro,SKU,ComponenteN8,componenteE8,ComponenteU8,8 nivel FROM psa-psa-cadena-qa.reporting_ecc_mx.tb_sku_componentes union all
SELECT centro,SKU,ComponenteN9,componenteE9,ComponenteU9,9 nivel FROM psa-psa-cadena-qa.reporting_ecc_mx.tb_sku_componentes union all
SELECT centro,SKU,ComponenteN10,componenteE10,ComponenteU10,10 nivel FROM psa-psa-cadena-qa.reporting_ecc_mx.tb_sku_componentes union all
SELECT centro,SKU,ComponenteN11,componenteE11,ComponenteU11,11 nivel FROM psa-psa-cadena-qa.reporting_ecc_mx.tb_sku_componentes union all
SELECT centro,SKU,ComponenteN12,componenteE12,ComponenteU12,12 nivel FROM psa-psa-cadena-qa.reporting_ecc_mx.tb_sku_componentes union all
SELECT centro,SKU,ComponenteN13,componenteE13,ComponenteU13,13 nivel FROM psa-psa-cadena-qa.reporting_ecc_mx.tb_sku_componentes union all
SELECT centro,SKU,ComponenteN14,componenteE14,ComponenteU14,14 nivel FROM psa-psa-cadena-qa.reporting_ecc_mx.tb_sku_componentes union all
SELECT centro,SKU,ComponenteN15,componenteE15,ComponenteU15,15 nivel FROM psa-psa-cadena-qa.reporting_ecc_mx.tb_sku_componentes




      ;;
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
    sql: ${TABLE}.SKU ;;
  }

  dimension: insumo {
    type: string
    sql: ${TABLE}.insumo ;;
  }

  dimension: stock_libre_uso {
    type: number
    sql: ${TABLE}.Stock_libre_uso ;;
  }

  measure: Totalstock_libre_uso {
    type: sum
    sql: ${TABLE}.Stock_libre_uso ;;
  }



  dimension: unidad_medida {
    type: string
    sql: ${TABLE}.Unidad_Medida ;;
  }

  dimension: nivel {
    type: number
    sql: ${TABLE}.nivel ;;
  }

  set: detail {
    fields: [
        centro,
  sku,
  insumo,
  stock_libre_uso,
  unidad_medida,
  nivel
    ]
  }
}
