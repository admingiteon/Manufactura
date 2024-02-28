
view: alacena {
  derived_table: {
    sql: select centro,fecha,nombre,ocupacion_final valor,'INVENTARIO FINAL (LU+QM), EN PALLETS' concepto,                               1 idconcepto from psa-psa-cadena-qa.modelo_de_calculo.LP_PT_Almacenamiento
      union all
      select centro,fecha,nombre,capacidad_total_ubicacion valor,'CAPACIDAD DE ALMACENAJE' concepto,                                     2 idconcepto from psa-psa-cadena-qa.modelo_de_calculo.LP_PT_Almacenamiento
      union all
      select centro,fecha,nombre,ocupacion_final/NULLIF(capacidad_total_ubicacion,0) valor,'USO DE CAPACIDAD DE ALMACENAJE (#)' concepto,3 idconcepto from psa-psa-cadena-qa.modelo_de_calculo.LP_PT_Almacenamiento ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: centro {
    type: string
    sql: ${TABLE}.centro ;;
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

  dimension: concepto {
    type: string
    sql: ${TABLE}.concepto ;;
  }

  dimension: idconcepto {
    type: number
    sql: ${TABLE}.idconcepto ;;
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
