
view: alm_lp_pt_almacenamiento {
  derived_table: {
    sql:

      select planta,grupo_art, centro,fecha,nombre,capacidad_total_ubicacion valor,'CAPACIDAD DE ALMACENAJE' concepto,1 idconcepto from psa-psa-cadena-qa.modelo_de_calculo.LP_PT_Almacenamiento
      union all
      select planta,grupo_art, centro,fecha,nombre,ocupacion_inicial valor,'OCUPACION INICIAL' concepto,2 idconcepto from psa-psa-cadena-qa.modelo_de_calculo.LP_PT_Almacenamiento
       union all
      select planta,grupo_art, centro,fecha,nombre,0 valor,'ENTRADAS' concepto,3 idconcepto from psa-psa-cadena-qa.modelo_de_calculo.LP_PT_Almacenamiento
      union all
      select planta,grupo_art, centro,fecha,nombre,0 valor,'SALIDAS' concepto,4 idconcepto from psa-psa-cadena-qa.modelo_de_calculo.LP_PT_Almacenamiento
      union all
      select planta,grupo_art, centro,fecha,nombre,ocupacion_final valor,'OCUPACION FINAL, EN PALLETS' concepto ,5 idconcepto from psa-psa-cadena-qa.modelo_de_calculo.LP_PT_Almacenamiento
      union all
      select planta,grupo_art, centro,fecha,nombre,ocupacion_final/NULLIF(capacidad_total_ubicacion,0) * 100 valor,'USO DE CAPACIDAD DE ALMACENAJE (%)' concepto,6 idconcepto from psa-psa-cadena-qa.modelo_de_calculo.LP_PT_Almacenamiento
      union all
      select planta,grupo_art, centro,fecha,nombre,case when  ocupacion_final > capacidad_total_ubicacion then capacidad_total_ubicacion /NULLIF(ocupacion_final,0) else 0 end valor,'FALTANTE DE CAPACIDAD DE ALMACENAJE (#)' concepto,7 idconcepto from psa-psa-cadena-qa.modelo_de_calculo.LP_PT_Almacenamiento
      union all
      select planta,grupo_art, centro,fecha,nombre,case when  ocupacion_final > capacidad_total_ubicacion then capacidad_total_ubicacion /NULLIF(ocupacion_final,0) else 0 end valor,'FALTANTE DE CAPACIDAD DE ALMACENAJE (%)' concepto,8 idconcepto from psa-psa-cadena-qa.modelo_de_calculo.LP_PT_Almacenamiento
       union all
      select planta,grupo_art, centro,fecha,nombre,cantidad_pallets valor,'TOTAL DE PALLETS MOVIDOS' concepto,9 idconcepto from psa-psa-cadena-qa.modelo_de_calculo.LP_PT_Almacenamiento


      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total {
    type: sum
    sql: ${TABLE}.valor ;;
    drill_fields: [detail*]
    value_format: "#,##0.00"
  }

  dimension: idconcepto {
    type: number
    sql: ${TABLE}.idconcepto ;;
  }


  dimension: centro {
    type: string
    sql: concat(${TABLE}.centro,'-',${TABLE}.nombre) ;;
  }




  dimension_group: fecha {
    type: time
    sql: ${TABLE}.fecha ;;
  }

  dimension: nombre {
    type: string
    sql: ${TABLE}.nombre ;;
  }

  dimension: valor {
    type: number
    sql: ${TABLE}.valor ;;
  }


  dimension: planta {
    type: string
    sql: ${TABLE}.valor ;;
  }

  dimension: grupo_art {
    type: string
    sql: ${TABLE}.valor ;;
  }





  dimension: concepto {
    type: string
    sql: ${TABLE}.concepto ;;
  }

  set: detail {
    fields: [
      centro,
      fecha_time,
      nombre,
      valor,
      concepto
    ]
  }
}
