view: almacenes_excedidos_simulacion {
  derived_table: {
    sql:
      SELECT *,
          DENSE_RANK() OVER (ORDER BY escenario_id DESC) AS row_num
          FROM `eon-bus-proj-cadena-demo.reporting_manufactura.vw_almacenes_excedidos_sm`;;
  }

  dimension: row_num {
    type: number
    sql: ${TABLE}.row_num ;;
  }

  dimension: escenario_id {
    type: string
    sql: ${TABLE}.escenario_id ;;
    order_by_field: row_num
  }

  dimension: centro {
    type: string
    sql: ${TABLE}.centro ;;
  }

  measure: capacidad {
    type: max
    sql: ${TABLE}.capacidad_total_ubicacion ;;
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
    label: "Ocupación Final"
    type: max
    sql: ${TABLE}.max_ocupacion_final ;;
  }

  measure: porcentaje_ocupacion {
    label: "Porcentaje Ocupación"
    type: sum
    sql: ${TABLE}.porcentaje_ocupacion ;;

    value_format: "0\%"

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
