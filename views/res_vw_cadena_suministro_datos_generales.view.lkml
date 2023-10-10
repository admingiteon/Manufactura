
view: res_vw_cadena_suministro_datos_generales {
  derived_table: {
    sql: select  
              material,
              precio_estandar,
              precio_medio_variable,
              precio_absorbente ,
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
