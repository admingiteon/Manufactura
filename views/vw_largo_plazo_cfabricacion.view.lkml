
view: vw_largo_plazo_cfabricacion {

  derived_table: {
    sql:


    select * from (
    SELECT * FROM `psa-psa-cadena-qa.reporting_ecc_mx.tb_largo_plazo_cfabricacion` where  planta not in (
'AS01',
'BA01',
'BI00',
'BT01',
'CM13',
'MA01',
'PY01'
)) a where a.planta not like ('AG%') ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: Total_cantidad {
    type: max
   sql: ${TABLE}.cantidad ;;
    value_format: "#,##0"
    drill_fields: [detail*]
  }


  measure: Total_sku{
    label: "cantidad SKU unicos"
    type: count_distinct
    sql:${sku};;

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


  dimension: Grupo_linea {
    type: string
    sql: ${TABLE}.gpolinea ;;
  }

  dimension: planta {
    type: string
    sql: ${TABLE}.planta ;;
  }

  dimension: describeplanta {
    type: string
    sql: ${TABLE}.describeplanta ;;
  }



  dimension: planta_descrip {
    type: string
    sql: concat(  ${TABLE}.planta ,'-',${TABLE}.describeplanta );;
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
