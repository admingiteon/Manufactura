
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
    sql: ${TABLE}.puesto_trabajo ;;
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
    sql: concat(  ${TABLE}.planta );;
  }




  dimension_group: periodo {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fecha ;;
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

  cantidad
    ]
  }
}
