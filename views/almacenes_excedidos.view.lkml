view: almacenes_excedidos {
derived_table: {
  sql:
      SELECT
        centro,
        fecha AS fecha,
        capacidad_total_ubicacion,
        ocupacion_final,
        nombre
      FROM modelo_de_calculo.LP_PT_Almacenamiento ;;
}

dimension: centro {
  type: string
  sql: ${TABLE}.centro ;;
}

  dimension: centro_nombre {
    type: string
    sql: ${TABLE}.nombre ;;
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


  html:

  {% if value >100 %}
  <p style="color:black; background-color: #D22B2B  ">{{ rendered_value }}</p>

  {% elsif value <80 %}
  <p style="color: black;">{{ rendered_value }}</p>

  {% elsif (value >=80 or value <=100) %}
  <p style="color: black; background-color: #FEED1B;">{{ rendered_value }}</p>

  {% endif %};;
}
}
