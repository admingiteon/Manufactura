view: almacenes_excedidos {
derived_table: {
  sql:
      SELECT
        centro,
        fecha AS fecha,
        capacidad_total_ubicacion,
        ocupacion_final
      FROM modelo_de_calculo.LP_PT_Almacenamiento ;;
}

dimension: centro {
  type: string
  sql: ${TABLE}.centro ;;
}


  dimension_group: fecha {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.fecha ;;
  }

dimension: capacidad_total_ubicacion {
  type: number
  sql: ${TABLE}.capacidad_total_ubicacion ;;
}

measure: max_ocupacion_final {
  type: max
  sql: ${TABLE}.ocupacion_final ;;
}

measure: porcentaje_ocupacion {
  type: number
  sql:
      CASE
        WHEN ROUND(${max_ocupacion_final} / ${capacidad_total_ubicacion} * 100, 0) > ${max_ocupacion_final} / ${capacidad_total_ubicacion} * 100 THEN
          CEIL(${max_ocupacion_final} / ${capacidad_total_ubicacion} * 100)
        ELSE
          FLOOR(${max_ocupacion_final} / ${capacidad_total_ubicacion} * 100)
      END ;;
}
}
