view: cobertura_fabricacion {
  derived_table: {
    sql: SELECT
posicion_actual,
cantidadrequerida
      FROM
          `eon-bus-proj-cadena-demo.modelo_de_calculo.LP_Insumo_Inventario_1`;;
  }

  dimension: material {
    type: string
    sql: SUBSTR(${TABLE}.material,12,50) ;;
  }

  dimension_group: fecha {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.fecha ;;
  }

  }
