view: cv_margen_utilidad {
    derived_table: {
      sql: SELECT *
        FROM
            `eon-bus-proj-cadena-demo.modelo_de_calculo.cv_margen_utilidad`

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
      label: "Plan De Ventaa"
      type: sum
      sql: ${TABLE}.plan_ventas;;
    }

    measure: porcentaje_no_cubierto{
      label: "Porcentaje No Cubierto"
      type: average
      sql: ${TABLE}.porcentaje_no_cubierto ;;
    }

    measure: perdida {
      type: sum
      sql: ${TABLE}.perdida ;;
    }


    measure: count {
      type: count
    }

  }
