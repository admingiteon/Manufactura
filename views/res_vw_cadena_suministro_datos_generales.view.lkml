
view: res_vw_cadena_suministro_datos_generales {
  derived_table: {
    sql: select
              material,
              precio_estandar,
              precio_medio_variable,
              precio_absorbente ,
              centro,
              indicador_control_precios /*s=standar, v=medio variable, a=absorbente ---No aplica--*/

      from psa-sga-dfn-qa.reporting_ecc_mx.vw_cadena_suministro_datos_generales ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: material {
    type: string
    sql: ${TABLE}.material ;;
  }

  dimension: centro {
    type: string
    sql: ${TABLE}.centro ;;
  }


  dimension: sku {
    type: string
    sql: SUBSTR(${TABLE}.material,12,10) ;;
  }

  dimension: precio_estandar {
    type: number
    sql: ${TABLE}.precio_estandar ;;
  }

  dimension: precio_medio_variable {
    type: number
    sql: ${TABLE}.precio_medio_variable ;;
  }

  dimension: precio_absorbente {
    type: number
    sql: ${TABLE}.precio_absorbente ;;
  }


  measure: Total_precio_estandar {
    label: "Costo Estandar"
    type: sum
    sql: ${TABLE}.precio_estandar ;;
  }

  measure: Total_precio_medio_variable {
    label: "Costo Medio Variable"
    type: sum
    sql: ${TABLE}.precio_medio_variable ;;
  }

  measure: Total_precio_absorbente {
    label: "Costo Absorbente"
    type: sum
    sql:case when ${TABLE}.precio_absorbente > 0 then ${TABLE}.precio_absorbente
             when ${TABLE}.precio_absorbente <= 0 and  ${TABLE}.precio_estandar > 0  then ${TABLE}.precio_estandar
             when ${TABLE}.precio_absorbente <= 0 and  ${TABLE}.precio_estandar <= 0  and  ${TABLE}.precio_medio_variable > 0  then ${TABLE}.precio_estandar end;;
  }




  dimension: indicador_control_precios {
    type: string
    sql: ${TABLE}.indicador_control_precios ;;
  }

  set: detail {
    fields: [
        material,
  precio_estandar,
  precio_medio_variable,
  precio_absorbente,
  indicador_control_precios
    ]
  }
}
