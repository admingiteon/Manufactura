
view: alm_lp_pt_almacenamiento {
  derived_table: {
    sql:

      select planta,grupo_art, centro,fecha,nombre,capacidad_total_ubicacion valor,'CAPACIDAD DE ALMACENAJE' concepto,1 idconcepto from psa-psa-cadena-qa.modelo_de_calculo.LP_PT_Almacenamiento
      union all
      select planta,grupo_art, centro,fecha,nombre,ocupacion_inicial valor,'OCUPACION INICIAL' concepto,2 idconcepto from psa-psa-cadena-qa.modelo_de_calculo.LP_PT_Almacenamiento
       union all
      select planta,grupo_art, centro,fecha,nombre,entradas valor,'ENTRADAS' concepto,3 idconcepto from psa-psa-cadena-qa.modelo_de_calculo.LP_PT_Almacenamiento
      union all
      select planta,grupo_art, centro,fecha,nombre,salidas valor,'SALIDAS' concepto,4 idconcepto from psa-psa-cadena-qa.modelo_de_calculo.LP_PT_Almacenamiento
      union all
      select planta,grupo_art, centro,fecha,nombre,ocupacion_final valor,'OCUPACION FINAL, EN PALLETS' concepto ,5 idconcepto from psa-psa-cadena-qa.modelo_de_calculo.LP_PT_Almacenamiento
      union all
      select planta,grupo_art, centro,fecha,nombre,ocupacion_final/NULLIF(capacidad_total_ubicacion,0) * 100 valor,'USO DE CAPACIDAD DE ALMACENAJE (%)' concepto,6 idconcepto from psa-psa-cadena-qa.modelo_de_calculo.LP_PT_Almacenamiento
      union all
      select planta,grupo_art, centro,fecha,nombre,case when  ocupacion_final > capacidad_total_ubicacion then capacidad_total_ubicacion /NULLIF(ocupacion_final,0) else 0 end valor,'FALTANTE DE CAPACIDAD DE ALMACENAJE (#)' concepto,7 idconcepto from psa-psa-cadena-qa.modelo_de_calculo.LP_PT_Almacenamiento
      union all
      select planta,grupo_art, centro,fecha,nombre,case when  ocupacion_final > capacidad_total_ubicacion then capacidad_total_ubicacion /NULLIF(ocupacion_final,0) else 0 end valor,'FALTANTE DE CAPACIDAD DE ALMACENAJE (%)' concepto,8 idconcepto from psa-psa-cadena-qa.modelo_de_calculo.LP_PT_Almacenamiento
       union all
      select planta,grupo_art, centro,fecha,nombre,total_pallets valor,'TOTAL DE PALLETS MOVIDOS' concepto,9 idconcepto from psa-psa-cadena-qa.modelo_de_calculo.LP_PT_Almacenamiento


      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total {
    type: max
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
    sql: ${TABLE}.planta ;;
  }



  dimension: grupo_art {
    type: string
    sql: case when  ${TABLE}.grupo_art = 'AM' then 'AMSA'
              when  ${TABLE}.grupo_art = 'A' then 'Anestesiología y Terapia Intensiva'
              when  ${TABLE}.grupo_art = 'T' then 'Antibióticos Intra-Hospitalarios'
              when  ${TABLE}.grupo_art = 'O' then 'Antibióticos de Prescripción'
              when ${TABLE}.grupo_art = 'L' then 'Control de Infecciones'
              when ${TABLE}.grupo_art = 'E' then 'Diálisis Peritoneal'
              when ${TABLE}.grupo_art = 'G' then 'Enfermedades Crónicas'
              when ${TABLE}.grupo_art = 'K' then 'Farmacéuticos OTC'
              when ${TABLE}.grupo_art = 'GP' then 'GENEPISA'
               when ${TABLE}.grupo_art = 'J' then 'Hemodiálisis'
      when ${TABLE}.grupo_art = 'MI' then 'Maquila Intl.'
      when ${TABLE}.grupo_art = 'M' then 'Maquila Nacional'
      when ${TABLE}.grupo_art = 'MP' then 'Marca Propia'
      when ${TABLE}.grupo_art = 'S' then 'NEUROLOGÍA y PSIQUIATRÍA'
      when ${TABLE}.grupo_art = 'F' then 'Nutrición'
      when ${TABLE}.grupo_art = 'D' then 'Oftalmología'
      when ${TABLE}.grupo_art = 'H' then 'Oncológicos'
      when ${TABLE}.grupo_art = 'Q' then 'Pediatría'
      when ${TABLE}.grupo_art = 'PMD' then 'Productos Medimix'
      when ${TABLE}.grupo_art = 'SM' then 'Salucom'
      when ${TABLE}.grupo_art = 'B' then 'Terapia de Infusión'
      when ${TABLE}.grupo_art = 'R' then 'Terapia del dolor'
      when ${TABLE}.grupo_art = 'N' then 'Transplantes'
      when ${TABLE}.grupo_art = 'VDD' then 'Venta Directa Dimesa'
      when ${TABLE}.grupo_art = 'U' then 'Genéricos'
      else ${TABLE}.grupo_art END  ;;
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
