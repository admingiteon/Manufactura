view: lp_insumo_inventario_1 {
  derived_table: {
    sql: SELECT
    id,
posicion_actual,
cantidadrequerida,
EXTRACT(DATE FROM fecha) AS fecha
      FROM
          `eon-bus-proj-cadena-demo.modelo_de_calculo.LP_Insumo_Inventario_1`;;
  }

  dimension: material {
    type: string
    sql: SUBSTR(SUBSTR(id, 1, INSTR(id, '_') - 1), 12, 50) ;;
  }

measure: posicion_actual {
  type: sum
  sql: ${TABLE}.posicion_actual ;;
}

  dimension: fecha {
    type: date
    sql: ${TABLE}.fecha ;;
  }

  measure: cantidad_requerida {
    type: sum
    sql: ${TABLE}.cantidadrequerida ;;
  }

  dimension_group: fecha {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.fecha ;;
  }

  measure: producible {
    type: yesno
    sql: CASE
    WHEN ${posicion_actual} < ${cantidad_requerida} AND DATE(${TABLE}.fecha) > CURRENT_DATE THEN true
    WHEN ${posicion_actual} < ${cantidad_requerida} AND DATE(${TABLE}.fecha) <= CURRENT_DATE THEN false
    ELSE NULL
    END ;;
  }


  }
