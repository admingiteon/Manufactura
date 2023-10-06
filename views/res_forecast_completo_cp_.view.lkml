
view: res_forecast_completo_cp_ {
  derived_table: {
    sql: select substring(id,1,18) as material,fecha,tipo,sum(cantidad) cantidad
              
      fROM `psa-psa-cadena-qa.modelo_de_calculo.forecast_completo_cp_`
      where  tipo='Forecast' and cantidad !=0 and    substring(id,1,18) in ( select material from `psa-psa-cadena-qa.reporting_ecc_mx.vw_consolidado_codigos_sku`)
      group by substring(id,1,18),fecha,tipo ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: material {
    type: string
    sql: ${TABLE}.material ;;
  }

  dimension_group: fecha {
    type: time
    sql: ${TABLE}.fecha ;;
  }

  dimension: tipo {
    type: string
    sql: ${TABLE}.tipo ;;
  }

  dimension: cantidad {
    type: number
    sql: ${TABLE}.cantidad ;;
  }

  measure: Total_cantidad {
    type: sum
    sql: ${TABLE}.cantidad ;;
  }

  set: detail {
    fields: [
        material,
  fecha_time,
  tipo,
  cantidad
    ]
  }
}
