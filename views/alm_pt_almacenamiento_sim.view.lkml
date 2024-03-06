view: alm_pt_almacenamiento_sim {


  derived_table: {
    sql:

     select planta,grupo_art, centro,fecha,nombre,capacidad_total_ubicacion valor,'CAPACIDAD DE ALMACENAJE' concepto,1 idconcepto,capacidad_total_ubicacion,ocupacion_inicial,capacidad_libre_ubicacion from `eon-bus-proj-cadena-demo.modelo_de_calculo.LP_PT_Almacenamiento`
      union all
      select planta,grupo_art, centro,fecha,nombre, ocupacion_inicial valor,'OCUPACION INICIAL' concepto,2 idconcepto,capacidad_total_ubicacion,ocupacion_inicial,capacidad_libre_ubicacion  from `eon-bus-proj-cadena-demo.modelo_de_calculo.LP_PT_Almacenamiento`
       union all
      select planta,grupo_art, centro,fecha,nombre,entradas valor,'ENTRADAS' concepto,3 idconcepto,capacidad_total_ubicacion,ocupacion_inicial,capacidad_libre_ubicacion  from `eon-bus-proj-cadena-demo.modelo_de_calculo_sm.LP_PT_Almacenamiento` where escenario_id=(select max(escenario_id)  from `eon-bus-proj-cadena-demo.modelo_de_calculo_sm.LP_PT_Almacenamiento`)
      union all
      select planta,grupo_art, centro,fecha,nombre,salidas valor,'SALIDAS' concepto,4 idconcepto,capacidad_total_ubicacion,ocupacion_inicial,capacidad_libre_ubicacion  from `eon-bus-proj-cadena-demo.modelo_de_calculo_sm.LP_PT_Almacenamiento` where  escenario_id=(select max(escenario_id)  from `eon-bus-proj-cadena-demo.modelo_de_calculo_sm.LP_PT_Almacenamiento`)
      union all
      select planta,grupo_art, centro,fecha,nombre,ocupacion_final valor,'OCUPACION FINAL, EN PALLETS' concepto ,5 idconcepto,capacidad_total_ubicacion,ocupacion_inicial,capacidad_libre_ubicacion  from `eon-bus-proj-cadena-demo.modelo_de_calculo.LP_PT_Almacenamiento`
      union all
      select planta,grupo_art, centro,fecha,nombre,ocupacion_final/NULLIF(capacidad_total_ubicacion,0) * 100 valor,'USO DE CAPACIDAD DE ALMACENAJE (%)' concepto,6 idconcepto,capacidad_total_ubicacion,ocupacion_inicial,capacidad_libre_ubicacion  from `eon-bus-proj-cadena-demo.modelo_de_calculo.LP_PT_Almacenamiento`
      union all
      select planta,grupo_art, centro,fecha,nombre, 0  valor,'FALTANTE DE CAPACIDAD DE ALMACENAJE (#)' concepto,7 idconcepto,capacidad_total_ubicacion,ocupacion_inicial,capacidad_libre_ubicacion  from `eon-bus-proj-cadena-demo.modelo_de_calculo.LP_PT_Almacenamiento`
      union all
      select planta,grupo_art, centro,fecha,nombre, ocupacion_final/NULLIF(capacidad_total_ubicacion,0) * 100 valor,'FALTANTE DE CAPACIDAD DE ALMACENAJE (%)' concepto,8 idconcepto,capacidad_total_ubicacion,ocupacion_inicial,capacidad_libre_ubicacion  from `eon-bus-proj-cadena-demo.modelo_de_calculo.LP_PT_Almacenamiento`
       union all
      select planta,grupo_art, centro,fecha,nombre,total_pallets valor,'TOTAL DE PALLETS MOVIDOS' concepto,9 idconcepto,capacidad_total_ubicacion,ocupacion_inicial,capacidad_libre_ubicacion  from `eon-bus-proj-cadena-demo.modelo_de_calculo.LP_PT_Almacenamiento`






      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }



  measure: total_CAPACIDAD_DE_ALMACENAJE {
    label: "CAPACIDAD DE ALMACENAJE"
    type: max
    sql: ${TABLE}.valor ;;
    filters: [idconcepto: "1"]
    drill_fields: [detail*]
    value_format: "#,##0.00"
  }

  measure: total_OCUPACION_INICIAL {
    label: "OCUPACION INICIAL"
    type: max
    sql: ${TABLE}.valor ;;
    filters: [idconcepto: "2"]
    drill_fields: [detail*]
    value_format: "#,##0.00"
  }

  measure: total_ENTRADAS {
    label: "ENTRADAS"
    type: sum
    sql: ${TABLE}.valor ;;
    filters: [idconcepto: "3"]
    drill_fields: [detail*]
    value_format: "#,##0.00"
  }

  measure: total_SALIDAS {
    label: "SALIDAS"
    type: sum
    sql: ${TABLE}.valor ;;
    filters: [idconcepto: "4"]
    drill_fields: [detail*]
    value_format: "#,##0.00"
  }

  measure: total_OCUPACION_FINAL_EN_PALLETS {
    label: "OCUPACION FINAL, EN PALLETS"
    type: min
    sql: ${TABLE}.valor ;;
    filters: [idconcepto: "5"]
    drill_fields: [detail*]
    value_format: "#,##0.00"
  }

  measure: total_USO_DE_CAPACIDAD_DE_ALMACENAJE_POR {
    label: "USO DE CAPACIDAD DE ALMACENAJE (%)"
    type: max
    sql: ${TABLE}.valor ;;
    filters: [idconcepto: "6"]
    drill_fields: [detail*]
    value_format: "#,##0.00"
  }

  measure: total_FALTANTE_DE_CAPACIDAD_DE_ALMACENAJE_NUM {
    label: "FALTANTE DE CAPACIDAD DE ALMACENAJE (#)"
    type: max
    sql: ${TABLE}.valor ;;
    filters: [idconcepto: "7"]
    drill_fields: [detail*]
    value_format: "#,##0.00"
  }

  measure: total_FALTANTE_DE_CAPACIDAD_DE_ALMACENAJE_POR {
    label: "FALTANTE DE CAPACIDAD DE ALMACENAJE (%)"
    type: max
    sql: ${TABLE}.valor ;;
    filters: [idconcepto: "8"]
    drill_fields: [detail*]
    value_format: "#,##0.00"
  }

  measure: total_TOTAL_DE_PALLETS_MOVIDOS {
    label: "TOTAL DE PALLETS MOVIDOS"
    type: sum
    sql: ${TABLE}.valor ;;
    filters: [idconcepto: "9"]
    drill_fields: [detail*]
    value_format: "#,##0.00"
  }

  measure: total {
    type: number
    sql: case when idconcepto in (1,2,6) then Max(${TABLE}.valor)
              when idconcepto in (5) then min(${TABLE}.valor)
              when idconcepto in (7) then Max(${TABLE}.capacidad_total_ubicacion)-Max(${TABLE}.ocupacion_inicial)
              when idconcepto in (8) then 100-Max(${TABLE}.valor) else  sum(${TABLE}.valor)
               end ;;
    drill_fields: [detail*]
    value_format: "#,##0.00"


    html:
          {% if   idconcepto._value  ==6 or  idconcepto._value  ==8   %}
          {% assign indicator = "black,%" | split: ',' %}
          {% else %}
          {% assign indicator = "black,PLT" | split: ',' %}
          {% endif %}

      <font color="{{indicator[0]}}">

      {% if value == 99999.12345 %} &infin

      {% else %}{{rendered_value}}

      {% endif %} {{indicator[1]}}

      </font> ;;


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
