view: cv_margen_utilidad {
    derived_table: {
      sql: SELECT *
        FROM
            `eon-bus-proj-cadena-demo.modelo_de_calculo.cv_margen_utilidad_v2`

        ;;
    }

    dimension: centro {
      type: string
      sql: ${TABLE}.centro ;;
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

    measure: plan_ventas {
      label: "Plan De Venta"
      type: sum
      sql: ${TABLE}.Plan_de_ventas;;
    }

    measure: porcentaje_no_cubierto{
      label: "Porcentaje Demanda No Cubierta"
      type: average
      value_format: "0\%"
      sql: CASE WHEN ${TABLE}.Porcentaje_no_cubierto < 0 then ${TABLE}.Porcentaje_no_cubierto*(-1) ELSE
       ${TABLE}.Porcentaje_no_cubierto END;;
    }

  measure: porcentaje_cubierto{
    label: "Porcentaje Cubierto"
    type: average
    value_format: "0\%"
    sql: ${TABLE}.Porcentaje_cubierto ;;
  }

    measure: perdida {
      label: "Pérdidas (Margen de Utilidad)"
      value_format: "$#,##0.00"
      type: sum
      sql: ${TABLE}.Perdida ;;
    }

  measure: ganancia {
    type: sum
    sql: ${TABLE}.Ganancia ;;
  }


  measure: margen {
    type: average
    sql: ${TABLE}.Margen ;;
  }


    measure: count {
      type: count
    }

  }
